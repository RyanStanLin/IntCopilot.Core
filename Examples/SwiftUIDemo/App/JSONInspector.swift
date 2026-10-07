import SwiftUI
import IntCopilotCore

struct ResultPanel: View {
    let value: JSONValue
    let title: String
    @State private var raw = false
    var body: some View {
        LabCard(title, symbol: "doc.text.magnifyingglass") {
            Toggle("原始 JSON", isOn: $raw).toggleStyle(.switch)
            if raw {
                ScrollView([.horizontal, .vertical]) { Text(QueryPlanning.pretty(value)).font(.system(.caption, design: .monospaced)).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .leading) }.frame(minHeight: 240, maxHeight: 500)
            } else {
                JSONNodeView(name: "响应", value: value, path: "root", title: title, depth: 0)
            }
            Text("完整数据只显示在当前内存页面中。请求记录仅包含路由、耗时和响应大小，不保存此正文。").font(.caption).foregroundStyle(.secondary)
        }
    }
}

struct JSONNodeView: View {
    let name: String
    let value: JSONValue
    let path: String
    let title: String
    let depth: Int
    @State private var expanded = false
    var children: [(String, JSONValue)] {
        if let object = value.objectValue { return object.keys.sorted().map { ($0, object[$0]!) } }
        if let array = value.arrayValue { return array.enumerated().map { (String($0.offset+1), $0.element) } }
        return []
    }
    var body: some View {
        if value.objectValue != nil || value.arrayValue != nil {
            DisclosureGroup(isExpanded: Binding(get: { depth == 0 || expanded }, set: { expanded = $0 })) {
                ForEach(Array(children.prefix(100)), id: \.0) { child in
                    JSONNodeView(name: child.0, value: child.1, path: path+"."+child.0, title: title, depth: depth+1)
                        .padding(.vertical, 3)
                }
                if children.count > 100 { Text("其余 \(children.count-100) 项可在原始 JSON 中查看。").font(.caption).foregroundStyle(.secondary) }
            } label: {
                HStack {
                    Text(displayName).fontWeight(.medium)
                    Text("\(children.count) 项").font(.caption).foregroundStyle(.secondary)
                    if let recordName = value["name"]?.stringValue ?? value["value"]?.stringValue ?? value["studentName"]?.stringValue { Text(recordName).font(.caption).foregroundStyle(.secondary).lineLimit(1) }
                }
            }
        } else {
            VStack(alignment: .leading, spacing: 3) {
                HStack(alignment: .top) {
                    Text(displayName).font(.caption).foregroundStyle(.secondary).frame(minWidth: 80, alignment: .leading)
                    Text(displayValue).font(.callout).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .leading)
                }
                if let meaning = FieldLabels.meanings[name] { Text(meaning).font(.caption2).foregroundStyle(.tertiary) }
            }
        }
    }
    private var displayName: String { FieldLabels.names[name].map { $0+" · "+name } ?? name }
    private var displayValue: String {
        if value == .null { return "null（未提供）" }
        let string = value.stringValue ?? QueryPlanning.pretty(value)
        let domain: String?
        if name == "gender" { domain = "gender" }
        else if ["relation","relationship","relationShip"].contains(name) { domain = "relationship" }
        else if name == "classType" { domain = "classType" }
        else if name == "courseType" { domain = "courseType" }
        else if name == "status", title.contains("考勤") { domain = "attendanceStatus" }
        else if name == "status", title.contains("请假") { domain = "leaveStatus" }
        else if name == "status", title == "完整学生资料" || title == "关联学生" || title == "课程学生名单" { domain = "studentStatus" }
        else if name == "type", title.contains("作业列表") { domain = "taskFeedType" }
        else if ["scoreMethod", "gradeType"].contains(name) { domain = "gradeType" }
        else { domain = nil }
        if let domain { return SemanticValue(rawValue: value, domain: domain).name + " · " + string }
        if let milliseconds = value.integerValue, milliseconds > 100_000_000_000, ["start","end","startTime","endTime","startDate","endDate","recordTime","createTime","updateTime"].contains(name) {
            return Date(timeIntervalSince1970: Double(milliseconds)/1000).formatted(date: .abbreviated, time: .shortened) + " · " + string + " ms"
        }
        return string
    }
}

enum FieldLabels {
    static let names = ["studentId":"学生标识","name":"名称","enName":"英文名称","status":"状态","type":"类型","schoolYearId":"学年标识","courseId":"课程标识","items":"记录列表","score":"成绩","gender":"性别","pageCurrent":"当前页","pageSize":"每页数量","totalItem":"记录总数","startTime":"开始时间","endTime":"结束时间","resourceIds":"资源标识","additionalFields":"新增字段","taskStudentId":"学生作业关联","classArrangeId":"课节安排标识","leaveApplicationId":"请假申请标识"]
    static let meanings: [String: String] = {
        guard let url = Bundle.main.url(forResource: "FieldCatalog", withExtension: "json"), let data = try? Data(contentsOf: url), let root = try? JSONDecoder().decode(JSONValue.self, from: data) else { return [:] }
        var result: [String:String] = [:]
        for key in (root.objectValue ?? [:]).keys.sorted() {
            for field in root[key]?.arrayValue ?? [] {
                if let name = field["field"]?.stringValue, let meaning = field["meaning"]?.stringValue, result[name] == nil { result[name] = meaning }
            }
        }
        return result
    }()
}
