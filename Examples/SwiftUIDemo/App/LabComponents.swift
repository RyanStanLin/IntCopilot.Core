import SwiftUI
import IntCopilotCore

struct LabCard<Content: View>: View {
    let title: String
    let symbol: String
    @ViewBuilder let content: () -> Content
    init(_ title: String, symbol: String, @ViewBuilder content: @escaping () -> Content) { self.title = title; self.symbol = symbol; self.content = content }
    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Label(title, systemImage: symbol).font(.headline)
            content()
        }.padding(18).frame(maxWidth: .infinity, alignment: .leading)
            .background(.background, in: RoundedRectangle(cornerRadius: 14))
            .overlay(RoundedRectangle(cornerRadius: 14).stroke(.secondary.opacity(0.18)))
    }
}

struct ActionButton: View {
    let title: String
    let symbol: String
    let action: @MainActor () async -> Void
    init(_ title: String, symbol: String = "arrow.clockwise", action: @escaping @MainActor () async -> Void) { self.title = title; self.symbol = symbol; self.action = action }
    var body: some View { Button { Task { await action() } } label: { Label(title, systemImage: symbol) }.buttonStyle(.bordered) }
}

struct ActionRow<Content: View>: View {
    @ViewBuilder let content: () -> Content
    var body: some View {
        ViewThatFits(in: .horizontal) {
            HStack { content() }.fixedSize(horizontal: true, vertical: false)
            VStack(alignment: .leading, spacing: 10) { content() }
        }
    }
}

struct RangeControls: View {
    @EnvironmentObject private var store: DemoStore
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            DatePicker("开始", selection: $store.start)
            DatePicker("结束", selection: $store.end)
            DatePicker("查询日期", selection: $store.date, displayedComponents: .date)
            Button("使用本周") { let range = SchoolDateRange.schoolWeek(containing: Date()); store.start = range.start; store.end = range.end }
            HStack {
                Stepper("第 \(store.page) 页", value: $store.page, in: 1...999)
                Picker("每页", selection: $store.pageSize) { ForEach([20,50,100], id: \.self) { Text("\($0) 条").tag($0) } }.frame(maxWidth: 180)
            }
        }
    }
}

struct OptionPicker: View {
    let title: String
    let options: [SemanticOption]
    @Binding var selection: String
    var body: some View {
        Picker(title, selection: $selection) {
            Text("请选择").tag("")
            ForEach(options) { option in Text(option.name + (option.enName.map { " · "+$0 } ?? "")).tag(option.id) }
        }
    }
}

struct MutationConfirmation: View {
    @EnvironmentObject private var store: DemoStore
    let pending: PendingMutation
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Label("确认真实操作", systemImage: "hand.raised.fill").font(.title2.bold()).foregroundStyle(.orange)
            Text(pending.title).font(.headline)
            Text(pending.method.rawValue + " " + pending.path).font(.caption.monospaced())
            Text("此操作可能修改平台数据或发送通知。只放行一次网络调用；失败不自动重试。请核对目标对象和内容。").foregroundStyle(.secondary)
            ScrollView { Text(pending.preview).font(.callout.monospaced()).textSelection(.enabled).frame(maxWidth: .infinity, alignment: .leading) }
            HStack {
                Button("取消") { store.pendingMutation = nil }
                Spacer()
                Button("我确认执行一次", role: .destructive) { Task { await store.confirmMutation() } }.buttonStyle(.borderedProminent)
            }
        }.padding(24).frame(minWidth: 300, idealWidth: 600, minHeight: 400)
    }
}
