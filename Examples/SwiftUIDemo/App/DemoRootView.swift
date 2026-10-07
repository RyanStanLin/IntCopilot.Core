import SwiftUI
import IntCopilotCore

struct DemoRootView: View {
    @EnvironmentObject private var store: DemoStore
    var body: some View {
        NavigationSplitView {
            VStack(spacing: 0) {
                VStack(alignment: .leading, spacing: 12) {
                    Label("IntCopilot", systemImage: "network").font(.title2.bold())
                    Text(store.offlineMode ? "Core 测试工作台 · 离线" : "Core 测试工作台 · 真实平台").font(.subheadline).foregroundStyle(.secondary)
                    Picker("平台", selection: Binding(get: { store.platform }, set: { value in Task { await store.switchPlatform(value) } })) {
                        Text("家长端").tag(Platform.parent)
                        Text("教师端").tag(Platform.teacher)
                    }.pickerStyle(.segmented).disabled(store.isBusy)
                    Label(store.isLoggedIn ? "会话已建立" : "尚未登录", systemImage: store.isLoggedIn ? "checkmark.shield.fill" : "lock.shield")
                        .font(.caption).foregroundStyle(store.isLoggedIn ? Color.green : Color.secondary)
                }.padding()
                List(selection: Binding<DemoSection?>(get: { store.section }, set: { if let value = $0 { store.section = value } })) {
                    ForEach(store.availableSections) { section in NavigationLink(value: section) { Label(section.rawValue, systemImage: section.icon) }.tag(section) }
                }.listStyle(.sidebar)
                Label("默认只读 · 写入逐次确认", systemImage: "shield.lefthalf.filled")
                    .font(.caption).foregroundStyle(.secondary).padding()
            }.navigationTitle("IntCopilot Demo")
            .navigationSplitViewColumnWidth(min: 220, ideal: 250, max: 310)
        } detail: {
            VStack(spacing: 0) {
                statusBar
                ScrollView {
                    VStack(alignment: .leading, spacing: 18) {
                        Text(store.section.rawValue).font(.largeTitle.bold())
                        if store.section != .authentication { ContextPanel() }
                        page.disabled(store.section != .authentication && store.selectedSchoolID != store.activeSchoolID)
                        if store.section != .history, let result = store.result { ResultPanel(value: result, title: store.resultTitle).id(store.resultTitle) }
                    }.padding(22).frame(maxWidth: 1100, alignment: .leading).frame(maxWidth: .infinity)
                }
            }.navigationTitle(store.section.rawValue)
            .toolbar { ToolbarItem { if store.isBusy { ProgressView().controlSize(.small) } } }
        }
        .sheet(item: $store.pendingMutation) { pending in MutationConfirmation(pending: pending) }
        .disabled(store.diagnosticRunning)
        .onChange(of: store.selectedCourseID) { _ in
            if store.platform == .teacher {
                store.students = []; store.selectedStudentID = ""; store.submissions = []; store.teacherTasks = []; store.teacherReports = []; store.attendanceRows = []
                store.selectedTaskID = ""; store.selectedSubmissionID = ""; store.selectedPeriodID = ""; store.optionSets["classPeriod"] = nil
            }
        }
        .onChange(of: store.selectedStudentID) { _ in
            store.parentTasks = []; store.parentReports = []; store.leaveRecords = []; store.selectedTaskID = ""; store.selectedReportID = ""; store.selectedLeaveID = ""
            if store.platform == .parent { store.courses = []; store.selectedCourseID = "" }
        }
    }
    @ViewBuilder private var page: some View {
        switch store.section {
        case .authentication: AuthenticationView()
        case .students: StudentView()
        case .course: CourseView()
        case .timetable: TimetableView()
        case .attendance: AttendanceView()
        case .assignments: AssignmentView()
        case .reports: ReportsView()
        case .diary: DiaryView()
        case .leave: LeaveView()
        case .options: OptionsView()
        case .catalog: CatalogView()
        case .manual: ManualView()
        case .history: TraceView()
        }
    }
    private var statusBar: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(store.status).font(.subheadline).foregroundStyle(.secondary)
                Spacer()
                Text(store.platform == .parent ? "pcd.intschool.cn" : "teacher.intschool.cn").font(.caption.monospaced()).foregroundStyle(.secondary)
            }
            if let error = store.errorMessage { Label(error, systemImage: "exclamationmark.triangle.fill").font(.callout).foregroundStyle(.red).textSelection(.enabled) }
        }.padding(.horizontal, 22).padding(.vertical, 12).background(.ultraThinMaterial)
    }
}

struct ContextPanel: View {
    @EnvironmentObject private var store: DemoStore
    var body: some View {
        LabCard("当前查询上下文", symbol: "person.crop.rectangle.stack") {
            ViewThatFits(in: .horizontal) {
                HStack(alignment: .top, spacing: 16) { controls }
                VStack(alignment: .leading, spacing: 12) { controls }
            }
            if !store.isLoggedIn { Text("请先登录。查询不会自动尝试账号密码，也不会自动发送验证码。").foregroundStyle(.secondary).font(.caption) }
            else if store.selectedSchoolID != store.activeSchoolID { Text("学校选择尚未应用。先点击“应用学校”，查询和写入会暂时锁定。").font(.caption).foregroundStyle(.orange) }
        }
    }
    @ViewBuilder private var controls: some View {
        VStack(alignment: .leading) {
            Picker("学校", selection: $store.selectedSchoolID) {
                Text("选择学校").tag("")
                ForEach(store.schools) { Text($0.name).tag($0.id.rawValue) }
            }.disabled(store.isBusy)
            ActionButton("应用学校", symbol: "building.2") { await store.selectSchool() }.disabled(!store.isLoggedIn)
        }
        VStack(alignment: .leading) {
            Picker("学生", selection: $store.selectedStudentID) {
                Text("选择学生").tag("")
                ForEach(store.students) { Text($0.name + ($0.enName.map { " · " + $0 } ?? "")).tag($0.id.rawValue) }
            }.disabled(store.isBusy)
            ActionButton(store.platform == .parent ? "获取关联学生" : "获取课程学生", symbol: "person.2") { await store.loadStudents() }.disabled(!store.isLoggedIn || store.selectedSchoolID != store.activeSchoolID)
        }
        VStack(alignment: .leading) {
            Picker("课程", selection: $store.selectedCourseID) {
                Text(store.platform == .parent ? "全部课程 / 未选择" : "选择课程").tag("")
                ForEach(store.courses) { Text($0.name).tag($0.id.rawValue) }
            }.disabled(store.isBusy)
            ActionButton("获取课程", symbol: "books.vertical") { await store.loadCourses() }.disabled(!store.isLoggedIn || store.selectedSchoolID != store.activeSchoolID)
        }
    }
}
