import SwiftUI
import IntCopilotCore

struct CatalogView: View {
    @EnvironmentObject private var store: DemoStore
    @State private var search = ""
    @State private var filter = "read"
    @State private var selectedID = ""
    @State private var queryText = "{}"
    @State private var bodyText = "{}"
    @State private var pathText = "{}"
    @State private var parameterKey = ""
    @State private var optionID = ""
    @State private var destination = "query"
    var endpoints: [EndpointDescriptor] {
        store.catalog.filter { endpoint in
            guard endpoint.platform == store.platform else { return false }
            if filter == "read", !(endpoint.safety == .readOnly && endpoint.safetyConfirmed) { return false }
            if filter == "write", endpoint.hasExternalSideEffects != true { return false }
            if filter == "experimental", endpoint.stability != .unstable { return false }
            return search.isEmpty || (endpoint.path+endpoint.name).localizedCaseInsensitiveContains(search)
        }.sorted {$0.id < $1.id}
    }
    var selected: EndpointDescriptor? { store.catalog.first {$0.id == selectedID && $0.platform == store.platform} }
    var allOptions: [SemanticOption] { store.optionSets.keys.sorted().flatMap {store.optionSets[$0] ?? []} }
    var body: some View {
        LabCard("从库契约目录探索全部功能", symbol: "network") {
            TextField("搜索路径或前端业务名称", text: $search).textFieldStyle(.roundedBorder)
            Picker("分类", selection: $filter) {
                Text("确认只读").tag("read"); Text("写入").tag("write"); Text("实验接口").tag("experimental"); Text("全部").tag("all")
            }.pickerStyle(.segmented)
            Text("当前平台 \(store.catalog.filter {$0.platform == store.platform}.count) 个端点；当前筛选 \(endpoints.count) 个。认证端点用登录页，业务查询可在这里逐步调试。").font(.caption).foregroundStyle(.secondary)
            Picker("接口", selection: $selectedID) {
                Text("选择接口").tag("")
                ForEach(endpoints) { Text($0.method.rawValue+" "+$0.path).tag($0.id) }
            }
            if let endpoint = selected { endpointEditor(endpoint) }
        }
        .onChange(of: selectedID) { _ in if let selected { applyContext(selected) } }
        .onChange(of: store.platform) { _ in selectedID = ""; queryText = "{}"; bodyText = "{}"; pathText = "{}" }
    }
    @ViewBuilder private func endpointEditor(_ endpoint: EndpointDescriptor) -> some View {
        HStack {
            Label(endpoint.stability == .stable ? "稳定契约" : "不稳定接口", systemImage: endpoint.stability == .stable ? "checkmark.seal" : "flask")
            Text(endpoint.safetyConfirmed ? (endpoint.hasExternalSideEffects == true ? "外部副作用" : "安全分类已确认") : "安全性未确认").foregroundStyle(endpoint.safetyConfirmed ? Color.secondary : Color.orange)
        }.font(.caption)
        if !endpoint.coveredByProvidedCaptures { Text("用户原始抓包未覆盖此接口").font(.caption).foregroundStyle(.orange) }
        ForEach(endpoint.warnings, id: \.self) { Text($0).font(.caption).foregroundStyle(.orange) }
        DisclosureGroup("参数依赖与证据") {
            ForEach(endpoint.dependencies.keys.sorted(), id: \.self) { key in Text(key+"："+(endpoint.dependencies[key] ?? "")).font(.caption).textSelection(.enabled) }
            ForEach(Array(endpoint.evidence.enumerated()), id: \.offset) { _, evidence in Text(evidence.kind.rawValue+" · "+evidence.reference).font(.caption).textSelection(.enabled) }
            if let expression = endpoint.requestExpression { Text(expression).font(.caption.monospaced()).textSelection(.enabled) }
        }
        Button("填入当前学生、课程、日期和分页") { applyContext(endpoint) }.buttonStyle(.bordered)
        JSONEditor(title: "路径标识", text: $pathText)
        JSONEditor(title: "Query 参数", text: $queryText)
        if endpoint.expectsJSONBody { JSONEditor(title: "JSON 请求体", text: $bodyText) }
        if !allOptions.isEmpty {
            DisclosureGroup("填入具名语义选项") {
                TextField("参数字段，例如 reasonId / status / primaryTypeId", text: $parameterKey).textFieldStyle(.roundedBorder)
                OptionPicker(title: "已获取选项", options: allOptions, selection: $optionID)
                Picker("位置", selection: $destination) { Text("Query").tag("query"); Text("Body").tag("body") }
                Button("插入选项") { insertOption() }.disabled(parameterKey.isEmpty || optionID.isEmpty)
            }
        }
        if endpoint.safety == .authentication {
            Text("请在登录页面执行认证流程，保留正确的 Cookie 与 Token 边界。").foregroundStyle(.secondary)
        } else if endpoint.safety == .readOnly && endpoint.safetyConfirmed && endpoint.hasExternalSideEffects == false {
            ActionButton("执行查询", symbol: "play.fill") { await store.perform("API 查询："+endpoint.path) { try await store.queryCatalog(endpoint, input: try makeInput(endpoint)) } }.disabled(!store.isLoggedIn)
        } else {
            Text("本接口只供你手动测试，未知行为不会在自动真实验证中执行。").font(.caption).foregroundStyle(.orange)
            Button("审查一次真实调用") {
                do {
                    let input = try makeInput(endpoint)
                    var path = endpoint.path
                    let bindings = try QueryPlanning.decode(pathText).objectValue ?? [:]
                    for (key, value) in bindings { path = path.replacingOccurrences(of: "{"+key+"}", with: value.stringValue ?? "") }
                    guard !path.contains("{") else { throw APIError.missingParameter("填写所有真实调用的路径参数") }
                    store.stageMutation("手动 API 调用", path: path, method: endpoint.method, preview: "\(endpoint.method.rawValue) \(path)\n稳定性：\(endpoint.stability.rawValue)\n安全性已确认：\(endpoint.safetyConfirmed)\n\nQuery：\(queryText)\nBody：\(bodyText)") { try await store.queryCatalog(endpoint, input: input) }
                } catch { store.errorMessage = friendlyError(error) }
            }.buttonStyle(.bordered).tint(.orange).disabled(!store.manualTesting || !store.isLoggedIn)
        }
    }
    private func makeInput(_ endpoint: EndpointDescriptor) throws -> APIInput {
        try QueryPlanning.makeInput(query: QueryPlanning.decode(queryText), body: QueryPlanning.decode(bodyText), path: QueryPlanning.decode(pathText), endpoint: endpoint)
    }
    private func applyContext(_ endpoint: EndpointDescriptor) {
        var query: [String:JSONValue] = [:], body: [String:JSONValue] = [:], path: [String:JSONValue] = [:]
        for key in endpoint.queryParameters { if let value = store.context.defaultValue(for: key) { query[key] = value } }
        for key in endpoint.bodyFields { if let value = store.context.defaultValue(for: key) { body[key] = value } }
        for key in endpoint.path.components(separatedBy: "{").dropFirst().compactMap({$0.components(separatedBy: "}").first}) { if let value = store.context.defaultValue(for: key) { path[key] = value } }
        queryText = QueryPlanning.pretty(.object(query)); bodyText = QueryPlanning.pretty(.object(body)); pathText = QueryPlanning.pretty(.object(path))
    }
    private func insertOption() {
        guard let option = allOptions.first(where: {$0.id == optionID}) else { return }
        do {
            var object = try QueryPlanning.decode(destination == "query" ? queryText : bodyText).objectValue ?? [:]
            object[parameterKey] = try store.encoded(option)
            let text = QueryPlanning.pretty(.object(object))
            if destination == "query" { queryText = text } else { bodyText = text }
        } catch { store.errorMessage = friendlyError(error) }
    }
}

struct JSONEditor: View {
    let title: String
    @Binding var text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(title).font(.subheadline.bold())
            TextEditor(text: $text).font(.system(.caption, design: .monospaced)).frame(minHeight: 80, idealHeight: 100, maxHeight: 220)
                .padding(6).overlay(RoundedRectangle(cornerRadius: 8).stroke(.secondary.opacity(0.25)))
        }
    }
}
