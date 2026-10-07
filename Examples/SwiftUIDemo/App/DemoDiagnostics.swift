import Foundation
import IntCopilotCore

@MainActor final class DemoDiagnostics {
    private var results: [JSONValue] = []
    private var started = false
    private var reportPath: String?
    private unowned let store: DemoStore
    init(store: DemoStore) { self.store = store }

    func startIfRequested() async {
        guard !started else { return }
        started = true
        let args = ProcessInfo.processInfo.arguments
        guard args.contains("--offline-smoke") || args.contains("--live-readonly-smoke") else { return }
        let live = args.contains("--live-readonly-smoke")
        reportPath = argument("--report-file", args: args)
        store.diagnosticRunning = true
        defer { store.diagnosticRunning = false }
        persist(.object(["进行中":.bool(true),"检查":.array([])]))
        do {
            let credentials: JSONValue
            if live {
                guard let path = argument("--credentials-file", args: args) else { throw APIError.missingParameter("--credentials-file") }
                credentials = try JSONDecoder().decode(JSONValue.self, from: Data(contentsOf: URL(fileURLWithPath: path)))
                await store.switchDataSource(false)
            } else {
                credentials = .object(["parent":.object(["account":"demo".json,"password":"demo".json]),"teacher":.object(["account":"demo".json,"password":"demo".json])])
                await store.switchDataSource(true)
            }
            await store.switchPlatform(.parent)
            await step("家长密码认证") { await self.store.passwordLogin(account: credentials["parent"]?["account"]?.stringValue ?? "", password: credentials["parent"]?["password"]?.stringValue ?? "") }
            if store.isLoggedIn {
                await step("家长关联学生") { await self.store.loadStudents() }
                if let student = store.students.first {
                    store.selectedStudentID = student.id.rawValue
                    for query in StudentQuery.allCases { await step("家长 · "+query.rawValue) { await self.store.loadStudent(query) } }
                    await step("家长课程") { await self.store.loadCourses() }
                    await step("家长作业列表") { await self.store.loadTasks() }
                    if let task = store.parentTasks.first(where: { $0.type.code == "1001" }) {
                        store.selectedTaskID = String(task.entityId)
                        await step("家长作业详情") { await self.store.loadTaskDetails() }
                    } else { skipped("家长作业详情", reason: "当前列表没有任务") }
                    await step("家长报告周期") { await self.store.loadReports() }
                    if let period = store.parentReports.first {
                        store.selectedReportID = String(period.gradePeriodId)
                        await step("家长报告详情") { await self.store.loadReportDetails() }
                    } else { skipped("家长报告详情", reason: "当前没有报告周期") }
                    await step("家长请假选项") { await self.store.loadLeaveOptions() }
                    await step("家长请假记录") { await self.store.loadLeaves() }
                    await step("家长学年字典") { await self.store.loadOptions(.schoolYears) }
                } else { skipped("家长学生业务", reason: "没有关联学生") }
                await tokenAndSnapshotChecks()
            }
            if !live {
                await store.logout()
                await step("离线短信发送") { await self.store.requestSMS(mobile: "13800000000", areaCode: "86") }
                await store.submitSMS("000000")
                results.append(.object(["操作":"短信错误后保留会话".json,"结果":(store.smsReady && !store.isLoggedIn ? "通过" : "失败").json]))
                await step("离线短信再次尝试成功") { await self.store.submitSMS("123456") }
            }
            await store.switchPlatform(.teacher)
            await step("教师门户密码与 SSO 认证") { await self.store.passwordLogin(account: credentials["teacher"]?["account"]?.stringValue ?? "", password: credentials["teacher"]?["password"]?.stringValue ?? "") }
            if store.isLoggedIn {
                await step("教师课程列表") { await self.store.loadCourses() }
                let course = live ? store.courses.first { $0.name.lowercased().contains("a2") && $0.name.lowercased().contains("computer science") } : store.courses.first
                if let course {
                    store.selectedCourseID = course.id.rawValue
                    await step("教师目标课程名单") { await self.store.loadStudents() }
                    let matches = store.students.filter {
                        let name = $0.name + " " + ($0.enName ?? "")
                        return name.localizedCaseInsensitiveContains("Ryan") && name.localizedCaseInsensitiveContains("Lin")
                    }
                    let target = live ? (matches.count == 1 ? matches.first : nil) : store.students.first
                    if let target {
                        store.selectedStudentID = target.id.rawValue
                        for query in [StudentQuery.details, .classes, .timetable, .attendance, .diary] { await step("教师目标学生 · "+query.rawValue) { await self.store.loadStudent(query) } }
                        await step("教师任务类型") { await self.store.loadOptions(.taskTypes) }
                        await step("教师作业列表") { await self.store.loadTasks() }
                        if let task = store.teacherTasks.first(where: { $0.type.code == "1001" }) {
                            store.selectedTaskID = String(task.entityId)
                            await step("教师目标课程作业详情") { await self.store.loadTaskDetails() }
                            await step("教师作业学生记录") { await self.store.loadSubmissions() }
                            let number = target.record["studentNum"]?.stringValue ?? target.record["code"]?.stringValue
                            let matches = store.submissions.filter { row in
                                if let number, !number.isEmpty { return row.studentNum == number }
                                return row.studentName == target.name || row.studentName == target.enName
                            }
                            if matches.count == 1, let submission = matches.first {
                                store.selectedSubmissionID = String(submission.taskStudentId)
                                await step("教师目标学生成绩详情") { await self.store.loadSubmissionDetails() }
                            } else { skipped("教师目标学生成绩详情", reason: "该任务没有目标学生的记录") }
                        } else { skipped("教师作业详情", reason: "当前没有任务") }
                        await step("教师目标课程课节选项") { await self.store.loadPeriods() }
                        await step("教师考勤状态字典") { await self.store.loadAttendanceStatuses() }
                        await step("教师目标课程报告周期") { await self.store.loadReports() }
                        if !live {
                            await step("离线教师成绩簿") { await self.store.loadStudent(.gradeBook) }
                            await step("离线教师个人课表") { await self.store.loadPersonalTimetable() }
                            if let period = store.optionsForPeriod.first {
                                store.selectedPeriodID = period.id
                                await step("离线教师课节考勤") { await self.store.loadClassAttendance() }
                            }
                            if let period = store.teacherReports.first {
                                store.selectedReportID = period.id
                                await step("离线教师班级报告") { await self.store.loadReportDetails() }
                            }
                            for query in OptionQuery.allCases.filter({ ![.diarySubtypes,.effort,.attainment].contains($0) }) { await step("离线教师字典 · "+query.rawValue) { await self.store.loadOptions(query) } }
                            if let primary = store.optionSets["diaryPrimaryType"]?.first { await step("离线日记子类型") { await self.store.loadOptions(.diarySubtypes, selected: primary) } }
                        }
                    } else { failure("教师目标学生", reason: "目标课程名单中未找到限定学生；停止学生查询") }
                } else { failure("教师目标课程", reason: "未找到限定课程；停止课程和学生查询") }
                await tokenAndSnapshotChecks()
            }
        } catch { failure("诊断初始化", reason: friendlyError(error)) }
        await store.logout()
        let summary: JSONValue = .object(["数据来源":(live ? "真实平台，只读" : "离线脱敏样本").json,"执行业务写入":.bool(false),"执行真实短信发送":.bool(false),"检查":.array(results)])
        store.result = summary; store.resultTitle = "两平台诊断结果"; store.status = "诊断已结束，已清除认证会话与个人数据。"; store.section = .authentication
        persist(summary)
    }
    private func persist(_ value: JSONValue) {
        if let output = reportPath {
            do {
                try QueryPlanning.pretty(value).write(toFile: output, atomically: true, encoding: .utf8)
                try FileManager.default.setAttributes([.posixPermissions:0o600], ofItemAtPath: output)
            } catch { store.errorMessage = "诊断报告写入失败："+error.localizedDescription }
        }
    }
    private func tokenAndSnapshotChecks() async {
        await step("\(store.platform.rawValue) 保存内存快照") { await self.store.saveSnapshot() }
        await step("\(store.platform.rawValue) 恢复内存快照") { await self.store.restoreSnapshot() }
        do {
            let snapshot = store.platform == .parent ? try await store.parent.snapshot() : try await store.teacher.snapshot()
            await step("\(store.platform.rawValue) 直接平台 Token") { await self.store.tokenLogin(snapshot.token, sso: false) }
        } catch { failure("Token 入口", reason: friendlyError(error)) }
    }
    private func step(_ title: String, action: @MainActor () async -> Void) async {
        await action()
        results.append(.object(["操作":title.json,"结果":(store.errorMessage == nil ? "通过" : "失败").json,"说明":store.errorMessage.map(\.json) ?? .null]))
        persist(.object(["进行中":.bool(true),"检查":.array(results)]))
    }
    private func skipped(_ title: String, reason: String) { results.append(.object(["操作":title.json,"结果":"跳过".json,"说明":reason.json])) }
    private func failure(_ title: String, reason: String) { results.append(.object(["操作":title.json,"结果":"失败".json,"说明":reason.json])) }
    private func argument(_ key: String, args: [String]) -> String? { guard let index = args.firstIndex(of: key), args.indices.contains(index+1) else { return nil }; return args[index+1] }
}
