import Foundation

public enum ParentEndpoints {
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceAttendanceStatusGET = CapturedEndpoint<ParentAttendanceAttendanceStatusGETResponse>(id: "parent:GET:/api/attendance/attendance-status")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceLeaveApplicationGET = CapturedEndpoint<ParentAttendanceLeaveApplicationGETResponse>(id: "parent:GET:/api/attendance/leave-application")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceStatisticStudentSchoolYearIdGET = CapturedEndpoint<ParentAttendanceStatisticStudentSchoolYearIdGETResponse>(id: "parent:GET:/api/attendance/statistic/student/{schoolYearId}")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let calendarByMonthGET = CapturedEndpoint<ParentCalendarByMonthGETResponse>(id: "parent:GET:/api/calendar/byMonth")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let courseRecordListByStudentGET = CapturedEndpoint<ParentCourseRecordListByStudentGETResponse>(id: "parent:GET:/api/course-record/listByStudent")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let curriculumStudentSchoolYearIdGET = CapturedEndpoint<ParentCurriculumStudentSchoolYearIdGETResponse>(id: "parent:GET:/api/curriculum/student/{schoolYearId}")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let diaryByStudentGET = CapturedEndpoint<ParentDiaryByStudentGETResponse>(id: "parent:GET:/api/diary/by-student")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownLeaveReasonsGET = CapturedEndpoint<ParentDropDownLeaveReasonsGETResponse>(id: "parent:GET:/api/dropDown/leave-reasons")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownRelatedAllCoursesGET = CapturedEndpoint<ParentDropDownRelatedAllCoursesGETResponse>(id: "parent:GET:/api/dropDown/relatedAllCourses")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownSchoolYearRuleListGET = CapturedEndpoint<ParentDropDownSchoolYearRuleListGETResponse>(id: "parent:GET:/api/dropDown/schoolYearRuleList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let monthlyGradeMonthlyGradeByStudentGET = CapturedEndpoint<ParentMonthlyGradeMonthlyGradeByStudentGETResponse>(id: "parent:GET:/api/monthly-grade/monthly-grade/by-student")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let monthlyGradeReportDetailGET = CapturedEndpoint<ParentMonthlyGradeReportDetailGETResponse>(id: "parent:GET:/api/monthly-grade/report/detail")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let studentClassInfoGET = CapturedEndpoint<ParentStudentClassInfoGETResponse>(id: "parent:GET:/api/student/class-info")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let studentDetailGET = CapturedEndpoint<ParentStudentDetailGETResponse>(id: "parent:GET:/api/student/detail")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let studentGetParentsGET = CapturedEndpoint<ParentStudentGetParentsGETResponse>(id: "parent:GET:/api/student/getParents")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let studentListGET = CapturedEndpoint<ParentStudentListGETResponse>(id: "parent:GET:/api/student/list")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let taskGradeGradeBookGET = CapturedEndpoint<ParentTaskGradeGradeBookGETResponse>(id: "parent:GET:/api/task-grade/grade-book")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let taskDetailGET = CapturedEndpoint<ParentTaskDetailGETResponse>(id: "parent:GET:/api/task/detail")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let taskMergeListGET = CapturedEndpoint<ParentTaskMergeListGETResponse>(id: "parent:GET:/api/task/mergeList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceLeaveApplicationPOST = CapturedEndpoint<ParentAttendanceLeaveApplicationPOSTResponse>(id: "parent:POST:/api/attendance/leave-application")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceLeaveApplicationRetrievePUT = CapturedEndpoint<ParentAttendanceLeaveApplicationRetrievePUTResponse>(id: "parent:PUT:/api/attendance/leave-application/retrieve")
    /// 补充只读观察确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let loginSchoolsGET = CapturedEndpoint<ParentLoginSchoolsGETResponse>(id: "parent:GET:/api/login/schools")
    /// 补充只读观察确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let semesterCurrentSchoolYearGET = CapturedEndpoint<ParentSemesterCurrentSchoolYearGETResponse>(id: "parent:GET:/api/semester/currentSchoolYear")
}
