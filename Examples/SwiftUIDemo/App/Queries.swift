import Foundation
import IntCopilotCore

extension DemoStore {
    func loadStudents() async {
        await perform(platform == .parent ? "关联学生" : "课程学生名单") {
            if self.platform == .parent { self.students = try await self.parent.students() }
            else { self.students = try await self.courseScope().students(page: self.pageRequest).students }
            if !self.students.contains(where: { $0.id.rawValue == self.selectedStudentID }) { self.selectedStudentID = self.students.count == 1 ? self.students[0].id.rawValue : "" }
            return .array(self.students.map(\.record))
        }
    }
    func loadCourses() async {
        await perform("课程列表") {
            if self.platform == .parent { self.courses = try await self.parent.student(self.requireStudent()).courses() }
            else { self.courses = try await self.teacher.courses() }
            if !self.courses.contains(where: { $0.id.rawValue == self.selectedCourseID }) { self.selectedCourseID = "" }
            return .array(self.courses.map(\.record))
        }
    }
    func loadStudent(_ query: StudentQuery) async {
        await perform(query.rawValue) {
            let student = try self.requireStudent()
            if self.platform == .parent {
                let scope = self.parent.student(student)
                switch query {
                case .details: return try self.encoded(await scope.details())
                case .classes: return try self.encoded(await scope.classInformation())
                case .parents: return try self.encoded(await scope.parents())
                case .timetable: return try self.encoded(await scope.timetable(in: self.range))
                case .attendance: return try self.encoded(await scope.attendance(in: self.range))
                case .diary: return try self.encoded(await scope.diary(page: self.pageRequest))
                case .courseRecords: return try self.encoded(await scope.courseRecords())
                case .calendar: return try self.encoded(await scope.calendar(monthContaining: self.date))
                case .gradeBook: return try self.encoded(await scope.gradeBook())
                }
            } else {
                let scope = self.teacher.student(student)
                switch query {
                case .details: return try self.encoded(await scope.details())
                case .classes: return try self.encoded(await scope.classInformation())
                case .timetable: return try self.encoded(await scope.timetable(in: self.range))
                case .attendance: return try self.encoded(await scope.attendance(in: self.range))
                case .diary: return try self.encoded(await scope.diary(page: self.pageRequest))
                case .gradeBook: return try self.encoded(await self.courseScope().gradeBook())
                default: throw APIError.unsupportedAuthentication
                }
            }
        }
    }
    func loadPersonalTimetable() async { await perform("教师个人课表") { try self.encoded(await self.teacher.personalTimetable(in: self.range)) } }
    func loadTasks() async {
        await perform("作业列表") {
            self.submissions = []; self.selectedTaskID = ""; self.selectedSubmissionID = ""
            if self.platform == .parent {
                let value = try await self.parent.student(self.requireStudent()).tasks(course: self.selectedCourse, page: self.pageRequest)
                self.parentTasks = value.items; return try self.encoded(value)
            }
            let value = try await self.courseScope().tasks(page: self.pageRequest)
            self.teacherTasks = value.items; return try self.encoded(value)
        }
    }
    func loadTaskDetails() async {
        await perform("作业详情") {
            if self.platform == .parent {
                guard let item = self.parentTasks.first(where: {String($0.entityId) == self.selectedTaskID}) else { throw APIError.missingParameter("选择作业") }
                return try self.encoded(await self.parent.student(self.requireStudent()).assignmentDetails(for: item))
            }
            guard !self.selectedTaskID.isEmpty else { throw APIError.missingParameter("选择作业") }
            return try self.encoded(await self.courseScope().taskDetails(TaskID(self.selectedTaskID)))
        }
    }
    func loadSubmissions() async {
        await perform("作业学生记录") {
            guard !self.selectedTaskID.isEmpty else { throw APIError.missingParameter("选择作业") }
            self.submissions = try await self.courseScope().submissions(for: TaskID(self.selectedTaskID))
            return try self.encoded(self.submissions)
        }
    }
    func loadSubmissionDetails() async {
        await perform("学生作业成绩详情") {
            guard let submission = self.submissions.first(where: {String($0.taskStudentId) == self.selectedSubmissionID}) else { throw APIError.missingParameter("选择学生作业记录") }
            return try self.encoded(await self.courseScope().submissionDetails(submission))
        }
    }
    func loadReports() async {
        await perform("报告周期") {
            self.selectedReportID = ""
            if self.platform == .parent {
                self.parentReports = try await self.parent.student(self.requireStudent()).reportPeriods()
                return try self.encoded(self.parentReports)
            }
            self.teacherReports = try await self.courseScope().reportPeriods()
            return try self.encoded(self.teacherReports)
        }
    }
    func loadReportDetails() async {
        await perform("成绩报告详情") {
            if self.platform == .parent {
                guard let period = self.parentReports.first(where: {String($0.gradePeriodId) == self.selectedReportID}) else { throw APIError.missingParameter("选择报告周期") }
                return try self.encoded(await self.parent.student(self.requireStudent()).report(for: period))
            }
            guard let period = self.teacherReports.first(where: {$0.id == self.selectedReportID}) else { throw APIError.missingParameter("选择报告周期") }
            return try self.encoded(await self.courseScope().monthlyGradeTable(period: period))
        }
    }
    func loadLeaveOptions() async {
        await perform("允许的请假类型与原因") {
            let value = try await self.parent.student(self.requireStudent()).leaveOptions()
            self.optionSets["leaveReason"] = value.reasons; self.optionSets["leaveKind"] = value.kinds
            return .object(["类型":try self.encoded(value.kinds),"原因":try self.encoded(value.reasons)])
        }
    }
    func loadLeaves() async {
        await perform("请假记录与审批状态") {
            let response = try await self.parent.student(self.requireStudent()).leaveApplications(page: self.pageRequest)
            self.leaveRecords = response.items; return try self.encoded(response)
        }
    }
    func loadPeriods() async {
        await perform("所选日期的课程课节") {
            let values = try await self.courseScope().periodOptions(on: self.date)
            self.optionSets["classPeriod"] = values; self.selectedPeriodID = ""; self.attendanceRows = []
            return try self.encoded(values)
        }
    }
    func loadAttendanceStatuses() async {
        await perform("平台考勤状态字典") {
            let values = try await self.courseScope().attendanceStatuses()
            self.optionSets["attendanceStatus"] = values
            return try self.encoded(values)
        }
    }
    func loadClassAttendance() async {
        await perform("课节考勤") {
            guard let period = self.optionsForPeriod.first(where: {$0.id == self.selectedPeriodID}) else { throw APIError.missingParameter("选择课节") }
            if self.courseKind == .cca { return try self.encoded(await self.courseScope().ccaAttendance(on: self.date, period: period, page: self.pageRequest)) }
            let response = try await self.courseScope().attendance(on: self.date, period: period, page: self.pageRequest)
            self.attendanceRows = response.attendances.items
            return try self.encoded(response)
        }
    }
    func loadOptions(_ kind: OptionQuery, selected: SemanticOption? = nil) async {
        await perform(kind.rawValue) {
            let service = self.optionService
            let values: [SemanticOption]
            switch kind {
            case .schoolYears: values = try await service.schoolYears()
            case .campuses: values = try await service.campuses()
            case .subjects: values = try await service.subjects()
            case .tutors: values = try await service.tutors()
            case .headTeachers: values = try await service.headTeachers()
            case .classes: values = try await service.classes()
            case .sections: values = try await service.sections()
            case .effort: guard let selected else { throw APIError.missingParameter("选择学部") }; values = try await service.effortLevels(campus: selected)
            case .attainment: guard let selected else { throw APIError.missingParameter("选择学部") }; values = try await service.attainmentLevels(campus: selected)
            case .taskTypes: values = try await self.courseScope().taskTypes()
            case .diaryTypes: values = try await self.teacher.diaryTypes()
            case .diarySubtypes: guard let selected else { throw APIError.missingParameter("选择日记主类型") }; values = try await self.teacher.diaryEntryTypes(for: selected)
            }
            self.optionSets[kind.domain] = values
            return try self.encoded(values)
        }
    }
    func loadRecipients(_ name: String) async {
        await perform("消息家长收件人") {
            let result = try await self.teacher.parentRecipients(search: name, page: self.pageRequest)
            self.recipientPage = result.recipients; self.selectedRecipientIDs = []
            return try self.encoded(result.page)
        }
    }
    func queryCatalog(_ endpoint: EndpointDescriptor, input: APIInput) async throws -> JSONValue {
        let experimental = platform == .parent ? parent.experimental : teacher.experimental
        let response = try await experimental.invoke(endpoint, input: input)
        if !response.data.isEmpty, response.value == .null { return .object(["非 JSON 响应字节数":.integer(response.data.count),"HTTP 状态":.integer(response.statusCode)]) }
        return response.value
    }
}

enum StudentQuery: String, CaseIterable {
    case details = "完整学生资料", classes = "班级与学院", parents = "关联家长资料", timetable = "学生课表", attendance = "学生考勤统计", diary = "学生行为记录", courseRecords = "课程选课记录", calendar = "月份校历", gradeBook = "成绩簿"
}
enum OptionQuery: String, CaseIterable {
    case schoolYears = "学年", campuses = "学部", subjects = "科目", tutors = "辅导师", headTeachers = "主班教师", classes = "主班级", sections = "课程班级", effort = "努力等级", attainment = "达成等级", taskTypes = "课程任务类型", diaryTypes = "日记主类型", diarySubtypes = "日记子类型"
    var domain: String {
        switch self {
        case .schoolYears: "schoolYear"
        case .campuses: "campus"
        case .subjects: "subject"
        case .tutors: "tutor"
        case .headTeachers: "headTeacher"
        case .classes: "homeroom"
        case .sections: "section"
        case .effort: "effort"
        case .attainment: "attainment"
        case .taskTypes: "taskType"
        case .diaryTypes: "diaryPrimaryType"
        case .diarySubtypes: "diaryEntryType"
        }
    }
}
