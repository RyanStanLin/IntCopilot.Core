import SwiftUI
import IntCopilotCore

@MainActor final class DemoStore: ObservableObject {
    @Published var platform: Platform = .parent
    @Published var section: DemoSection = .authentication
    @Published var offlineMode = ProcessInfo.processInfo.arguments.contains("--offline")
    @Published var isBusy = false
    @Published var diagnosticRunning = false
    @Published var isLoggedIn = false
    @Published var status = "选择平台并登录，即可从具名学生与课程开始查询。"
    @Published var errorMessage: String?
    @Published var result: JSONValue?
    @Published var resultTitle = "查询结果"
    @Published var traces: [RequestTrace] = []
    @Published var schools: [School] = []
    @Published var selectedSchoolID = ""
    @Published var activeSchoolID = ""
    @Published var students: [Student] = []
    @Published var selectedStudentID = ""
    @Published var courses: [Course] = []
    @Published var selectedCourseID = ""
    @Published var courseKind: CourseKind = .regular
    @Published var page = 1
    @Published var pageSize = 50
    @Published var start = SchoolDateRange.schoolWeek(containing: Date()).start
    @Published var end = SchoolDateRange.schoolWeek(containing: Date()).end
    @Published var date = Date()
    @Published var optionSets: [String: [SemanticOption]] = [:]
    @Published var parentTasks: [ParentTaskMergeListGETResponseItemsItem] = []
    @Published var teacherTasks: [TeacherTaskMergeListGETResponseItemsItem] = []
    @Published var submissions: [TeacherTaskPerformanceGETResponseItem] = []
    @Published var parentReports: [ParentMonthlyGradeMonthlyGradeByStudentGETResponseItem] = []
    @Published var teacherReports: [SemanticOption] = []
    @Published var leaveRecords: [ParentAttendanceLeaveApplicationGETResponseItemsItem] = []
    @Published var attendanceRows: [TeacherAttendanceClassGETResponseAttendancesItemsItem] = []
    @Published var recipientPage: [ParentMessageRecipient] = []
    @Published var selectedTaskID = ""
    @Published var selectedSubmissionID = ""
    @Published var selectedReportID = ""
    @Published var selectedPeriodID = ""
    @Published var selectedAttendanceRowID = ""
    @Published var selectedLeaveID = ""
    @Published var selectedRecipientIDs: Set<String> = []
    @Published var manualTesting = false
    @Published var pendingMutation: PendingMutation?
    @Published var smsReady = false
    @Published var snapshotInfo = "尚无内存快照"
    var parentTransport: GuardedTransport
    var teacherTransport: GuardedTransport
    var parent: ParentClient
    var teacher: TeacherClient
    let catalog: [EndpointDescriptor]
    private var sms: SMSLogin?
    private var savedParent: SessionSnapshot?
    private var savedTeacher: SessionSnapshot?
    lazy var diagnostics = DemoDiagnostics(store: self)

    init() {
        let offline = ProcessInfo.processInfo.arguments.contains("--offline")
        parentTransport = try! GuardedTransport(platform: .parent, base: offline ? FixtureTransport(platform: .parent) : URLSessionTransport())
        teacherTransport = try! GuardedTransport(platform: .teacher, base: offline ? FixtureTransport(platform: .teacher) : URLSessionTransport())
        parent = ParentClient(transport: parentTransport)
        teacher = TeacherClient(transport: teacherTransport)
        catalog = (try? APIContractCatalog.endpoints()) ?? []
    }
    var currentTransport: GuardedTransport { platform == .parent ? parentTransport : teacherTransport }
    var selectedStudent: Student? { students.first { $0.id.rawValue == selectedStudentID } }
    var selectedCourse: Course? { courses.first { $0.id.rawValue == selectedCourseID } }
    var pageRequest: PageRequest { PageRequest(number: page, size: pageSize) }
    var range: SchoolDateRange { SchoolDateRange(start: start, end: end) }
    var context: QueryContext { QueryContext(studentID: selectedStudent?.id.rawValue, courseID: selectedCourse?.id.rawValue, start: start, end: end, date: date, page: page, pageSize: pageSize) }
    var optionService: ContextOptions { platform == .parent ? parent.options : teacher.options }
    var optionsForPeriod: [SemanticOption] { optionSets["classPeriod"] ?? [] }
    var availableSections: [DemoSection] { DemoSection.allCases.filter { platform == .teacher || $0 != .course } }

    func perform(_ title: String, operation: @escaping @MainActor () async throws -> JSONValue) async {
        guard !isBusy else { return }
        isBusy = true; errorMessage = nil; status = "正在读取："+title
        defer { isBusy = false }
        do { result = try await operation(); resultTitle = title; status = title+"已完成" }
        catch { errorMessage = friendlyError(error); status = title+"未完成" }
        traces = await currentTransport.history()
    }
    func encoded<T: Encodable>(_ value: T) throws -> JSONValue { try JSONDecoder().decode(JSONValue.self, from: JSONEncoder().encode(value)) }
    func switchDataSource(_ offline: Bool) async {
        guard !isBusy, offline != offlineMode else { return }
        await logout(); offlineMode = offline
        parentTransport = try! GuardedTransport(platform: .parent, base: offline ? FixtureTransport(platform: .parent) : URLSessionTransport())
        teacherTransport = try! GuardedTransport(platform: .teacher, base: offline ? FixtureTransport(platform: .teacher) : URLSessionTransport())
        parent = ParentClient(transport: parentTransport); teacher = TeacherClient(transport: teacherTransport)
        traces = []; status = offline ? "离线样本模式，不连接真实平台。" : "真实平台模式，默认只读。"
    }
    func switchPlatform(_ value: Platform) async {
        guard !isBusy, value != platform else { return }
        await logout(); platform = value; section = .authentication
        status = "已切换平台，请登录。"
    }
    func passwordLogin(account: String, password: String) async {
        isLoggedIn = false; clearContext()
        await perform("账号密码登录") {
            let login = self.platform == .parent ? try await self.parent.login(account: account, password: password) : try await self.teacher.login(account: account, password: password)
            return try await self.accept(login)
        }
    }
    func tokenLogin(_ value: String, sso: Bool) async {
        isLoggedIn = false; clearContext()
        await perform(sso ? "教师 SSO Token 交换" : "平台 Token 登录") {
            let login: LoginResult
            if self.platform == .parent { login = try await self.parent.login(token: PlatformToken(value)) }
            else if sso { login = try await self.teacher.login(ssoAccessToken: value) }
            else { login = try await self.teacher.login(token: PlatformToken(value)) }
            return try await self.accept(login)
        }
    }
    func requestSMS(mobile: String, areaCode: String) async {
        guard platform == .parent else { return }
        if sms == nil { isLoggedIn = false; clearContext() }
        await perform("发送短信验证码") {
            if let challenge = self.sms {
                guard challenge.mobile == mobile, challenge.areaCode == areaCode else { throw APIError.invalidParameter("修改手机号前请取消当前短信会话") }
                try await self.parentTransport.approveOnce(method: .get, path: "/api/login/vcodeMobileSend")
                try await challenge.resend()
            } else {
                try await self.parentTransport.approveOnce(method: .get, path: "/api/login/vcodeMobileSend")
                self.sms = try await self.parent.requestSMSCode(to: mobile, areaCode: areaCode)
            }
            self.smsReady = true; self.isLoggedIn = false
            return .object(["等待验证码":.bool(true),"允许重试":.bool(true)])
        }
    }
    func submitSMS(_ code: String) async {
        await perform("验证码登录") {
            guard let sms = self.sms else { throw APIError.authenticationRequired }
            let result = try await sms.submit(code: code)
            self.sms = nil; self.smsReady = false
            return try await self.accept(result)
        }
    }
    private func accept(_ login: LoginResult) async throws -> JSONValue {
        schools = login.schools; selectedSchoolID = login.selectedSchool?.id.rawValue ?? ""; activeSchoolID = selectedSchoolID; isLoggedIn = true
        sms = nil; smsReady = false
        let value: JSONValue = .object(["学校":.array(schools.map(\.record)),"当前学校":login.selectedSchool?.record ?? .null,"Token":"已保存在 SDK 内存，不显示原文".json])
        return value
    }
    func selectSchool() async {
        await perform("切换学校") {
            guard let school = self.schools.first(where: {$0.id.rawValue == self.selectedSchoolID}) else { throw APIError.schoolSelectionRequired }
            self.clearContext(); self.activeSchoolID = ""
            if self.platform == .parent { try await self.parent.selectSchool(school) } else { try await self.teacher.selectSchool(school) }
            self.activeSchoolID = school.id.rawValue; return school.record
        }
    }
    func logout() async {
        await parentTransport.revokePermits(); await teacherTransport.revokePermits()
        await parent.logout(); await teacher.logout()
        isLoggedIn = false; schools = []; selectedSchoolID = ""; activeSchoolID = ""; sms = nil; smsReady = false
        savedParent = nil; savedTeacher = nil; snapshotInfo = "尚无内存快照"
        clearContext(); result = nil; errorMessage = nil; pendingMutation = nil; manualTesting = false
    }
    func clearContext() {
        students = []; courses = []; selectedStudentID = ""; selectedCourseID = ""; optionSets = [:]
        parentTasks = []; teacherTasks = []; submissions = []; parentReports = []; teacherReports = []
        leaveRecords = []; attendanceRows = []; recipientPage = []; selectedRecipientIDs = []
        selectedTaskID = ""; selectedSubmissionID = ""; selectedReportID = ""; selectedPeriodID = ""; selectedAttendanceRowID = ""; selectedLeaveID = ""
    }
    func requireStudent() throws -> Student { guard let selectedStudent else { throw APIError.missingParameter("先获取并选择学生") }; return selectedStudent }
    func requireCourse() throws -> Course { guard let selectedCourse else { throw APIError.missingParameter("先获取并选择课程") }; return selectedCourse }
    func courseScope() throws -> TeacherCourseScope { teacher.course(try requireCourse(), kind: courseKind) }
    func refreshTrace() async { traces = await currentTransport.history() }
    func saveSnapshot() async {
        await perform("内存会话快照") {
            let value = self.platform == .parent ? try await self.parent.snapshot() : try await self.teacher.snapshot()
            if self.platform == .parent { self.savedParent = value } else { self.savedTeacher = value }
            self.snapshotInfo = "已保存于 App 内存；\(value.cookies.count) 个 Cookie；不会写入磁盘"
            return .object(["platform":.string(value.platform.rawValue),"selectedSchoolID":value.selectedSchoolID.map { .string($0.rawValue) } ?? .null,"cookiesCount":.integer(value.cookies.count),"expiresAt":value.expiresAt.map { .string($0.formatted()) } ?? .null])
        }
    }
    func restoreSnapshot() async {
        await perform("恢复内存快照") {
            let login: LoginResult
            if self.platform == .parent { guard let snapshot = self.savedParent else { throw APIError.invalidParameter("先保存家长快照") }; login = try await self.parent.restore(snapshot) }
            else { guard let snapshot = self.savedTeacher else { throw APIError.invalidParameter("先保存教师快照") }; login = try await self.teacher.restore(snapshot) }
            self.clearContext(); return try await self.accept(login)
        }
    }
    func stageMutation(_ title: String, path: String, method: HTTPMethod, preview: String, operation: @escaping @MainActor () async throws -> JSONValue) {
        guard manualTesting, !isBusy else { errorMessage = "先在手动测试区解锁业务操作。"; return }
        pendingMutation = PendingMutation(title: title, path: path, method: method, preview: preview, operation: operation)
    }
    func confirmMutation() async {
        guard let pending = pendingMutation, manualTesting else { return }
        pendingMutation = nil
        await perform(pending.title) {
            let transport = self.currentTransport
            try await transport.approveOnce(method: pending.method, path: pending.path)
            do {
                let result = try await pending.operation()
                await transport.revokePermits()
                return result
            } catch {
                await transport.revokePermits()
                throw error
            }
        }
    }
}

struct PendingMutation: Identifiable {
    let id = UUID()
    let title: String
    let path: String
    let method: HTTPMethod
    let preview: String
    let operation: @MainActor () async throws -> JSONValue
}

enum DemoSection: String, CaseIterable, Identifiable {
    case authentication = "登录与会话", students = "学生资料", course = "课程与名单", timetable = "课表与校历", attendance = "考勤与课节", assignments = "作业与成绩", reports = "成绩报告", diary = "行为日记", leave = "请假记录", options = "选项字典", catalog = "完整 API 目录", manual = "手动写入测试", history = "请求记录"
    var id: String { rawValue }
    var icon: String {
        switch self {
        case .authentication: "person.badge.key.fill"
        case .students: "person.2.fill"
        case .course: "books.vertical.fill"
        case .timetable: "calendar"
        case .attendance: "checkmark.circle.fill"
        case .assignments: "list.clipboard.fill"
        case .reports: "chart.bar.doc.horizontal.fill"
        case .diary: "book.closed.fill"
        case .leave: "calendar.badge.clock"
        case .options: "slider.horizontal.3"
        case .catalog: "network"
        case .manual: "hand.tap.fill"
        case .history: "clock.arrow.circlepath"
        }
    }
}

func friendlyError(_ error: any Error) -> String {
    switch error {
    case APIError.invalidCredentials: "账号或密码被拒绝，请重新输入。"
    case APIError.invalidVerificationCode: "验证码不正确，可以保留当前短信会话继续输入。"
    case APIError.authenticationRequired: "会话失效或尚未登录，请在登录页面重新认证。"
    case APIError.schoolSelectionRequired: "请先选择学校。"
    case APIError.staleSession: "账号或学校上下文已变化，请重新查询。"
    case APIError.invalidParameter(let value): "参数不符合要求：\(value)"
    case APIError.missingParameter(let value): "缺少前置信息：\(value)"
    case APIError.permissionDenied: "当前账号不允许此操作。"
    case APIError.invalidResponse(let value): "响应契约不一致：\(value)"
    case APIError.backend(let status, let code, let message): "服务器返回 HTTP \(status)，业务代码 \(code.map(String.init) ?? "无")：\(message)"
    case DecodingError.keyNotFound(let key, let context): "库模型与响应不一致：缺少 \((context.codingPath+[key]).map(\.stringValue).joined(separator: "."))"
    case DecodingError.typeMismatch(_, let context): "库模型字段类型不一致：\(context.codingPath.map(\.stringValue).joined(separator: "."))"
    case DecodingError.valueNotFound(_, let context): "库模型字段实际为空：\(context.codingPath.map(\.stringValue).joined(separator: "."))"
    default: error.localizedDescription
    }
}

extension String { var json: JSONValue { .string(self) } }
