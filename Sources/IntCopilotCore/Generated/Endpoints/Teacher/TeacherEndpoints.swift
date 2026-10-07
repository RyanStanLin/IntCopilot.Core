import Foundation

public enum TeacherEndpoints {
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let diaryDELETE = CapturedEndpoint<TeacherDiaryDELETEResponse>(id: "teacher:DELETE:/api/diary")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let taskDeleteDELETE = CapturedEndpoint<TeacherTaskDeleteDELETEResponse>(id: "teacher:DELETE:/api/task/delete")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceAttendancePermissionGET = CapturedEndpoint<TeacherAttendanceAttendancePermissionGETResponse>(id: "teacher:GET:/api/attendance/attendance-permission")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceAttendanceStatusGET = CapturedEndpoint<TeacherAttendanceAttendanceStatusGETResponse>(id: "teacher:GET:/api/attendance/attendance-status")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceClassGET = CapturedEndpoint<TeacherAttendanceClassGETResponse>(id: "teacher:GET:/api/attendance/class")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceClassCcaGET = CapturedEndpoint<TeacherAttendanceClassCcaGETResponse>(id: "teacher:GET:/api/attendance/class/cca")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceClassListGET = CapturedEndpoint<TeacherAttendanceClassListGETResponse>(id: "teacher:GET:/api/attendance/classList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceDailyGET = CapturedEndpoint<TeacherAttendanceDailyGETResponse>(id: "teacher:GET:/api/attendance/daily")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceDormitoryDailyGET = CapturedEndpoint<TeacherAttendanceDormitoryDailyGETResponse>(id: "teacher:GET:/api/attendance/dormitory/daily")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceSsRoomDailyGET = CapturedEndpoint<TeacherAttendanceSsRoomDailyGETResponse>(id: "teacher:GET:/api/attendance/ssRoom/daily")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceStatisticClassGET = CapturedEndpoint<TeacherAttendanceStatisticClassGETResponse>(id: "teacher:GET:/api/attendance/statistic/class")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceStatisticClassPeriodGET = CapturedEndpoint<TeacherAttendanceStatisticClassPeriodGETResponse>(id: "teacher:GET:/api/attendance/statistic/class-period")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceStatisticCourseStudentGET = CapturedEndpoint<TeacherAttendanceStatisticCourseStudentGETResponse>(id: "teacher:GET:/api/attendance/statistic/course/student")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceStatisticDormitoryGET = CapturedEndpoint<TeacherAttendanceStatisticDormitoryGETResponse>(id: "teacher:GET:/api/attendance/statistic/dormitory")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceStatisticHouseGET = CapturedEndpoint<TeacherAttendanceStatisticHouseGETResponse>(id: "teacher:GET:/api/attendance/statistic/house")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceStatisticSectionGET = CapturedEndpoint<TeacherAttendanceStatisticSectionGETResponse>(id: "teacher:GET:/api/attendance/statistic/section")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceStatisticSsrGET = CapturedEndpoint<TeacherAttendanceStatisticSsrGETResponse>(id: "teacher:GET:/api/attendance/statistic/ssr")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceStatisticStudentDetailSchoolYearIdGET = CapturedEndpoint<TeacherAttendanceStatisticStudentDetailSchoolYearIdGETResponse>(id: "teacher:GET:/api/attendance/statistic/student/detail/{schoolYearId}")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceStatisticStudentSchoolYearIdGET = CapturedEndpoint<TeacherAttendanceStatisticStudentSchoolYearIdGETResponse>(id: "teacher:GET:/api/attendance/statistic/student/{schoolYearId}")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let courseRecordListByStudentGET = CapturedEndpoint<TeacherCourseRecordListByStudentGETResponse>(id: "teacher:GET:/api/course-record/listByStudent")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let courseCascadeAttendanceGET = CapturedEndpoint<TeacherCourseCascadeAttendanceGETResponse>(id: "teacher:GET:/api/course/cascade/attendance")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let courseCascadeBySchoolYearGET = CapturedEndpoint<TeacherCourseCascadeBySchoolYearGETResponse>(id: "teacher:GET:/api/course/cascadeBySchoolYear")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let courseCourseAndCcaGET = CapturedEndpoint<TeacherCourseCourseAndCcaGETResponse>(id: "teacher:GET:/api/course/courseAndCca")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let courseStudentsGET = CapturedEndpoint<TeacherCourseStudentsGETResponse>(id: "teacher:GET:/api/course/students")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let curriculumRoomGET = CapturedEndpoint<TeacherCurriculumRoomGETResponse>(id: "teacher:GET:/api/curriculum/room")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let curriculumStudentSchoolYearIdGET = CapturedEndpoint<TeacherCurriculumStudentSchoolYearIdGETResponse>(id: "teacher:GET:/api/curriculum/student/{schoolYearId}")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let curriculumTeacherGET = CapturedEndpoint<TeacherCurriculumTeacherGETResponse>(id: "teacher:GET:/api/curriculum/teacher")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let curriculumTeacherPersonalGET = CapturedEndpoint<TeacherCurriculumTeacherPersonalGETResponse>(id: "teacher:GET:/api/curriculum/teacher/personal")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let diaryByStudentGET = CapturedEndpoint<TeacherDiaryByStudentGETResponse>(id: "teacher:GET:/api/diary/by-student")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let diaryEntriesGET = CapturedEndpoint<TeacherDiaryEntriesGETResponse>(id: "teacher:GET:/api/diary/entries")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let diaryEntryTypeGET = CapturedEndpoint<TeacherDiaryEntryTypeGETResponse>(id: "teacher:GET:/api/diary/entry-type")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let diaryPrimaryTypeGET = CapturedEndpoint<TeacherDiaryPrimaryTypeGETResponse>(id: "teacher:GET:/api/diary/primary-type")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownAuthTeachersForMessageGET = CapturedEndpoint<TeacherDropDownAuthTeachersForMessageGETResponse>(id: "teacher:GET:/api/dropDown/authTeachersForMessage")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownAuthTeachersForMyClassGET = CapturedEndpoint<TeacherDropDownAuthTeachersForMyClassGETResponse>(id: "teacher:GET:/api/dropDown/authTeachersForMyClass")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownCampusListGET = CapturedEndpoint<TeacherDropDownCampusListGETResponse>(id: "teacher:GET:/api/dropDown/campusList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownClassListAllGET = CapturedEndpoint<TeacherDropDownClassListAllGETResponse>(id: "teacher:GET:/api/dropDown/classListAll")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownClassRoomCascadeGET = CapturedEndpoint<TeacherDropDownClassRoomCascadeGETResponse>(id: "teacher:GET:/api/dropDown/classRoomCascade")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownCourseTeacherGET = CapturedEndpoint<TeacherDropDownCourseTeacherGETResponse>(id: "teacher:GET:/api/dropDown/course-teacher")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownDormitoryListGET = CapturedEndpoint<TeacherDropDownDormitoryListGETResponse>(id: "teacher:GET:/api/dropDown/dormitoryList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownFloorAndDormitoryListGET = CapturedEndpoint<TeacherDropDownFloorAndDormitoryListGETResponse>(id: "teacher:GET:/api/dropDown/floorAndDormitoryList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownFloorAndDormitoryListAllGET = CapturedEndpoint<TeacherDropDownFloorAndDormitoryListAllGETResponse>(id: "teacher:GET:/api/dropDown/floorAndDormitoryListAll")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownFloorListGET = CapturedEndpoint<TeacherDropDownFloorListGETResponse>(id: "teacher:GET:/api/dropDown/floorList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownHeadTeachersGET = CapturedEndpoint<TeacherDropDownHeadTeachersGETResponse>(id: "teacher:GET:/api/dropDown/head-teachers")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownHouseGroupListAllGET = CapturedEndpoint<TeacherDropDownHouseGroupListAllGETResponse>(id: "teacher:GET:/api/dropDown/houseGroupListAll")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownMessageReceiverGET = CapturedEndpoint<TeacherDropDownMessageReceiverGETResponse>(id: "teacher:GET:/api/dropDown/message/receiver")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownSchoolYearListGET = CapturedEndpoint<TeacherDropDownSchoolYearListGETResponse>(id: "teacher:GET:/api/dropDown/schoolYearList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownSchoolYearRuleListGET = CapturedEndpoint<TeacherDropDownSchoolYearRuleListGETResponse>(id: "teacher:GET:/api/dropDown/schoolYearRuleList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownSectionCascadeGET = CapturedEndpoint<TeacherDropDownSectionCascadeGETResponse>(id: "teacher:GET:/api/dropDown/sectionCascade")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownSectionListCpAttendanceGET = CapturedEndpoint<TeacherDropDownSectionListCpAttendanceGETResponse>(id: "teacher:GET:/api/dropDown/sectionList/cpAttendance")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownSemesterGET = CapturedEndpoint<TeacherDropDownSemesterGETResponse>(id: "teacher:GET:/api/dropDown/semester")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownSsRoomListGET = CapturedEndpoint<TeacherDropDownSsRoomListGETResponse>(id: "teacher:GET:/api/dropDown/ssRoomList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownSsRoomListAllGET = CapturedEndpoint<TeacherDropDownSsRoomListAllGETResponse>(id: "teacher:GET:/api/dropDown/ssRoomListAll")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownSubjectListGET = CapturedEndpoint<TeacherDropDownSubjectListGETResponse>(id: "teacher:GET:/api/dropDown/subjectList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownSubjectListForAttendanceGET = CapturedEndpoint<TeacherDropDownSubjectListForAttendanceGETResponse>(id: "teacher:GET:/api/dropDown/subjectListForAttendance")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownTaskTypeGET = CapturedEndpoint<TeacherDropDownTaskTypeGETResponse>(id: "teacher:GET:/api/dropDown/taskType")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownTaskTypeByCourseGET = CapturedEndpoint<TeacherDropDownTaskTypeByCourseGETResponse>(id: "teacher:GET:/api/dropDown/taskTypeByCourse")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let dropDownTutorsGET = CapturedEndpoint<TeacherDropDownTutorsGETResponse>(id: "teacher:GET:/api/dropDown/tutors")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let gradeBookGradeBookGET = CapturedEndpoint<TeacherGradeBookGradeBookGETResponse>(id: "teacher:GET:/api/grade-book/grade-book")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let messageFromDetailGET = CapturedEndpoint<TeacherMessageFromDetailGETResponse>(id: "teacher:GET:/api/message/fromDetail")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let messageFromListGET = CapturedEndpoint<TeacherMessageFromListGETResponse>(id: "teacher:GET:/api/message/fromList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let messageToListGET = CapturedEndpoint<TeacherMessageToListGETResponse>(id: "teacher:GET:/api/message/toList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let monthlyGradeBehaviorTableGET = CapturedEndpoint<TeacherMonthlyGradeBehaviorTableGETResponse>(id: "teacher:GET:/api/monthly-grade/behavior-table")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let monthlyGradeGradePeriodGET = CapturedEndpoint<TeacherMonthlyGradeGradePeriodGETResponse>(id: "teacher:GET:/api/monthly-grade/grade-period")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let monthlyGradeGradePeriodCourseIdGET = CapturedEndpoint<TeacherMonthlyGradeGradePeriodCourseIdGETResponse>(id: "teacher:GET:/api/monthly-grade/grade-period/{courseId}")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let monthlyGradeGradeTableGradePeriodIdCourseIdGET = CapturedEndpoint<TeacherMonthlyGradeGradeTableGradePeriodIdCourseIdGETResponse>(id: "teacher:GET:/api/monthly-grade/gradeTable/{gradePeriodId}/{courseId}")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let monthlyGradeLevelAttainmentGET = CapturedEndpoint<TeacherMonthlyGradeLevelAttainmentGETResponse>(id: "teacher:GET:/api/monthly-grade/level/attainment")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let monthlyGradeLevelEffortGET = CapturedEndpoint<TeacherMonthlyGradeLevelEffortGETResponse>(id: "teacher:GET:/api/monthly-grade/level/effort")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let monthlyGradeReportGET = CapturedEndpoint<TeacherMonthlyGradeReportGETResponse>(id: "teacher:GET:/api/monthly-grade/report")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let monthlyGradeReportStudentIdGET = CapturedEndpoint<TeacherMonthlyGradeReportStudentIdGETResponse>(id: "teacher:GET:/api/monthly-grade/report/student-id")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let monthlyGradeTeachingReviewListGET = CapturedEndpoint<TeacherMonthlyGradeTeachingReviewListGETResponse>(id: "teacher:GET:/api/monthly-grade/teachingReview/list")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let semesterCurrentSchoolYearGET = CapturedEndpoint<TeacherSemesterCurrentSchoolYearGETResponse>(id: "teacher:GET:/api/semester/currentSchoolYear")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let studentClassInfoGET = CapturedEndpoint<TeacherStudentClassInfoGETResponse>(id: "teacher:GET:/api/student/class-info")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let studentClassAndHouseGET = CapturedEndpoint<TeacherStudentClassAndHouseGETResponse>(id: "teacher:GET:/api/student/classAndHouse")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let studentDetailGET = CapturedEndpoint<TeacherStudentDetailGETResponse>(id: "teacher:GET:/api/student/detail")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let studentStudentBriefInfoGET = CapturedEndpoint<TeacherStudentStudentBriefInfoGETResponse>(id: "teacher:GET:/api/student/studentBriefInfo")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let taskGradeRuleGET = CapturedEndpoint<TeacherTaskGradeRuleGETResponse>(id: "teacher:GET:/api/task-grade/rule")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let taskDetailGET = CapturedEndpoint<TeacherTaskDetailGETResponse>(id: "teacher:GET:/api/task/detail")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let taskMergeListGET = CapturedEndpoint<TeacherTaskMergeListGETResponse>(id: "teacher:GET:/api/task/mergeList")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let taskPerformanceGET = CapturedEndpoint<TeacherTaskPerformanceGETResponse>(id: "teacher:GET:/api/task/performance")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let taskStudentDetailGET = CapturedEndpoint<TeacherTaskStudentDetailGETResponse>(id: "teacher:GET:/api/task/student/detail")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let teacherListAllGET = CapturedEndpoint<TeacherTeacherListAllGETResponse>(id: "teacher:GET:/api/teacher/listAll")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let diaryPOST = CapturedEndpoint<TeacherDiaryPOSTResponse>(id: "teacher:POST:/api/diary")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let messageSendPOST = CapturedEndpoint<TeacherMessageSendPOSTResponse>(id: "teacher:POST:/api/message/send")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let monthlyGradePOST = CapturedEndpoint<TeacherMonthlyGradePOSTResponse>(id: "teacher:POST:/api/monthly-grade")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let monthlyGradeBehaviorRecordPOST = CapturedEndpoint<TeacherMonthlyGradeBehaviorRecordPOSTResponse>(id: "teacher:POST:/api/monthly-grade/behaviorRecord")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let performanceTaskPOST = CapturedEndpoint<TeacherPerformanceTaskPOSTResponse>(id: "teacher:POST:/api/performance/task")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let studentMyStudentPOST = CapturedEndpoint<TeacherStudentMyStudentPOSTResponse>(id: "teacher:POST:/api/student/my-student")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let studentStudentIdPOST = CapturedEndpoint<TeacherStudentStudentIdPOSTResponse>(id: "teacher:POST:/api/student/student-id")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let taskAddPOST = CapturedEndpoint<TeacherTaskAddPOSTResponse>(id: "teacher:POST:/api/task/add")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceClassPUT = CapturedEndpoint<TeacherAttendanceClassPUTResponse>(id: "teacher:PUT:/api/attendance/class")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceDailyPUT = CapturedEndpoint<TeacherAttendanceDailyPUTResponse>(id: "teacher:PUT:/api/attendance/daily")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let attendanceSsRoomUpdatePUT = CapturedEndpoint<TeacherAttendanceSsRoomUpdatePUTResponse>(id: "teacher:PUT:/api/attendance/ssRoom/update")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let messageWithdrawPUT = CapturedEndpoint<TeacherMessageWithdrawPUTResponse>(id: "teacher:PUT:/api/message/withdraw")
    /// 用户抓包确认的端点契约；请求与副作用详情可通过 descriptor 查看。
    public static let taskUpdateScorePUT = CapturedEndpoint<TeacherTaskUpdateScorePUTResponse>(id: "teacher:PUT:/api/task/updateScore")
}
