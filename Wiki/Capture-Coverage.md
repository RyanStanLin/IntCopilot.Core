# 原始抓包覆盖记录

以下编号只引用本地抓包，不包含原始文件、账号、Token、Cookie 或真人数据。认证的空/非 JSON 重定向通过专用流程 mock 验证。

| 请求端点 | 原始抓包编号 |
|---|---|
| [parent:GET:/api/attendance/attendance-status](API-parent-attendance#endpoint-c2929f80255b) | 362 |
| [parent:GET:/api/attendance/leave-application](API-parent-attendance#endpoint-d79e7d4199da) | 395 |
| [parent:GET:/api/attendance/statistic/student/{schoolYearId}](API-parent-attendance#endpoint-4a5aa188b593) | 363 |
| [parent:GET:/api/calendar/byMonth](API-parent-calendar#endpoint-d591d897aad7) | 431 |
| [parent:GET:/api/course-record/listByStudent](API-parent-course-record#endpoint-8720745342ba) | 249 |
| [parent:GET:/api/curriculum/student/{schoolYearId}](API-parent-curriculum#endpoint-426d09163fd4) | 261 |
| [parent:GET:/api/diary/by-student](API-parent-diary#endpoint-53106b0491aa) | 348 |
| [parent:GET:/api/dropDown/leave-reasons](API-parent-dropDown#endpoint-19f433bf9009) | 406 |
| [parent:GET:/api/dropDown/relatedAllCourses](API-parent-dropDown#endpoint-2f178d559578) | 275, 299 |
| [parent:GET:/api/dropDown/schoolYearRuleList](API-parent-dropDown#endpoint-c0a6f8edfb12) | 244 |
| [parent:GET:/api/login/vcodeMobileSend](API-parent-login#endpoint-1d6159c66ed1) | 468 |
| [parent:GET:/api/monthly-grade/monthly-grade/by-student](API-parent-monthly-grade#endpoint-7ed24e051e1f) | 333 |
| [parent:GET:/api/monthly-grade/report/detail](API-parent-monthly-grade#endpoint-5cd139722dcb) | 334 |
| [parent:GET:/api/student/class-info](API-parent-student#endpoint-4d4eab466668) | 245 |
| [parent:GET:/api/student/detail](API-parent-student#endpoint-31992af551fb) | 235 |
| [parent:GET:/api/student/getParents](API-parent-student#endpoint-9b0a003585a4) | 239 |
| [parent:GET:/api/student/list](API-parent-student#endpoint-ddd046aba236) | 871 |
| [parent:GET:/api/task-grade/grade-book](API-parent-task-grade#endpoint-b8091cae3f11) | 315 |
| [parent:GET:/api/task/detail](API-parent-task#endpoint-1ac0d2a1e2c8) | 286 |
| [parent:GET:/api/task/mergeList](API-parent-task#endpoint-f52ae79caae5) | 277, 300 |
| [parent:POST:/api/attendance/leave-application](API-parent-attendance#endpoint-f31876918672) | 410 |
| [parent:POST:/api/login/unify](API-parent-login#endpoint-82a125cd48c0) | 184, 187, 469, 472 |
| [parent:PUT:/api/attendance/leave-application/retrieve](API-parent-attendance#endpoint-059a22fa2577) | 421 |
| [portal:GET:/api/api/user/info](API-portal-api#endpoint-029517fb0064) | 1118 |
| [portal:POST:/api/login](API-portal-login#endpoint-243fe9948d3b) | 1097, 1109 |
| [portal:POST:/api/oauth/authorize](API-portal-oauth#endpoint-96e505322afd) | 1133 |
| [print:GET:/api/render](API-print-render#endpoint-9c4c5d146201) | 263 |
| [teacher:DELETE:/api/diary](API-teacher-diary#endpoint-93730817ab98) | 2537 |
| [teacher:DELETE:/api/task/delete](API-teacher-task#endpoint-bd3e18d081c0) | 2036 |
| [teacher:GET:/api/attendance/attendance-permission](API-teacher-attendance#endpoint-6fbc37945703) | 1162 |
| [teacher:GET:/api/attendance/attendance-status](API-teacher-attendance#endpoint-dff7722ee96d) | 2438, 1243 |
| [teacher:GET:/api/attendance/class](API-teacher-attendance#endpoint-1c08e552b32f) | 1245 |
| [teacher:GET:/api/attendance/class/cca](API-teacher-attendance#endpoint-d165c766b3f7) | 1363 |
| [teacher:GET:/api/attendance/classList](API-teacher-attendance#endpoint-485590a67e07) | 1347 |
| [teacher:GET:/api/attendance/daily](API-teacher-attendance#endpoint-b06715505ead) | 1352 |
| [teacher:GET:/api/attendance/dormitory/daily](API-teacher-attendance#endpoint-a72bbabb7e84) | 1406 |
| [teacher:GET:/api/attendance/leave-application/pending](API-teacher-attendance#endpoint-5a12e21db350) | 2226 |
| [teacher:GET:/api/attendance/ssRoom/daily](API-teacher-attendance#endpoint-e27f88872a89) | 1414, 1416 |
| [teacher:GET:/api/attendance/statistic/class](API-teacher-attendance#endpoint-ea736a7d565c) | 1438, 1453 |
| [teacher:GET:/api/attendance/statistic/class-period](API-teacher-attendance#endpoint-c1434495e236) | 1465, 1492 |
| [teacher:GET:/api/attendance/statistic/course/student](API-teacher-attendance#endpoint-f3c9d640718b) | 2441 |
| [teacher:GET:/api/attendance/statistic/dormitory](API-teacher-attendance#endpoint-0c6f3b8c740b) | 1497 |
| [teacher:GET:/api/attendance/statistic/house](API-teacher-attendance#endpoint-eb2aef105634) | 1428 |
| [teacher:GET:/api/attendance/statistic/section](API-teacher-attendance#endpoint-6516a14e394d) | 1425 |
| [teacher:GET:/api/attendance/statistic/ssr](API-teacher-attendance#endpoint-a0f8ed3e41cd) | 1501 |
| [teacher:GET:/api/attendance/statistic/student/detail/{schoolYearId}](API-teacher-attendance#endpoint-fa6f4f06ad16) | 2440 |
| [teacher:GET:/api/attendance/statistic/student/{schoolYearId}](API-teacher-attendance#endpoint-18f85ae31222) | 2439 |
| [teacher:GET:/api/course-record/listByStudent](API-teacher-course-record#endpoint-17e16a43c56a) | 2429 |
| [teacher:GET:/api/course/cascade/attendance](API-teacher-course#endpoint-5d9c3057c18f) | 1361 |
| [teacher:GET:/api/course/cascadeBySchoolYear](API-teacher-course#endpoint-8fe1424bdaf0) | 1730, 1912 |
| [teacher:GET:/api/course/courseAndCca](API-teacher-course#endpoint-cd260415ea3b) | 1172 |
| [teacher:GET:/api/course/students](API-teacher-course#endpoint-a84d7d961c28) | 1190 |
| [teacher:GET:/api/curriculum/room](API-teacher-curriculum#endpoint-820fc62368dc) | 1548 |
| [teacher:GET:/api/curriculum/student/{schoolYearId}](API-teacher-curriculum#endpoint-3d98d617cde6) | 2424 |
| [teacher:GET:/api/curriculum/teacher](API-teacher-curriculum#endpoint-372531144eb8) | 1541 |
| [teacher:GET:/api/curriculum/teacher/personal](API-teacher-curriculum#endpoint-0adb1797d94c) | 1532 |
| [teacher:GET:/api/diary/by-student](API-teacher-diary#endpoint-053a65577f3d) | 2436 |
| [teacher:GET:/api/diary/entries](API-teacher-diary#endpoint-d2dc605f0dd7) | 1513, 1525 |
| [teacher:GET:/api/diary/entry-type](API-teacher-diary#endpoint-042ffc697d0f) | 2833, 2834 |
| [teacher:GET:/api/diary/primary-type](API-teacher-diary#endpoint-f72f75be97e8) | 2814, 1507 |
| [teacher:GET:/api/dropDown/authTeachersForMessage](API-teacher-dropDown#endpoint-6e20e4395a66) | 1606 |
| [teacher:GET:/api/dropDown/authTeachersForMyClass](API-teacher-dropDown#endpoint-5999ee993b4d) | 1165 |
| [teacher:GET:/api/dropDown/campusList](API-teacher-dropDown#endpoint-1337bb79ae60) | 1435 |
| [teacher:GET:/api/dropDown/classListAll](API-teacher-dropDown#endpoint-29182cd29411) | 1634 |
| [teacher:GET:/api/dropDown/classRoomCascade](API-teacher-dropDown#endpoint-84296fa7ec6f) | 1545 |
| [teacher:GET:/api/dropDown/course-teacher](API-teacher-dropDown#endpoint-a12cbfb19958) | 1622 |
| [teacher:GET:/api/dropDown/dormitoryList](API-teacher-dropDown#endpoint-4c57f84ad325) | 1405 |
| [teacher:GET:/api/dropDown/floorAndDormitoryList](API-teacher-dropDown#endpoint-46a5ab101e79) | 1509 |
| [teacher:GET:/api/dropDown/floorAndDormitoryListAll](API-teacher-dropDown#endpoint-319da334222a) | 1635 |
| [teacher:GET:/api/dropDown/floorList](API-teacher-dropDown#endpoint-0fc9ab2f85df) | 1404 |
| [teacher:GET:/api/dropDown/head-teachers](API-teacher-dropDown#endpoint-8d298a77a992) | 1621 |
| [teacher:GET:/api/dropDown/houseGroupListAll](API-teacher-dropDown#endpoint-c757e8557b06) | 1508, 1618, 1633 |
| [teacher:GET:/api/dropDown/message/receiver](API-teacher-dropDown#endpoint-6e17729ea0b2) | 1645 |
| [teacher:GET:/api/dropDown/schoolYearList](API-teacher-dropDown#endpoint-e7447665846d) | 1511 |
| [teacher:GET:/api/dropDown/schoolYearRuleList](API-teacher-dropDown#endpoint-73c464f44d8c) | 2425, 2437, 1910 |
| [teacher:GET:/api/dropDown/sectionCascade](API-teacher-dropDown#endpoint-1771098af5a4) | 1514, 1632 |
| [teacher:GET:/api/dropDown/sectionList/cpAttendance](API-teacher-dropDown#endpoint-8a41da3440a2) | 1449 |
| [teacher:GET:/api/dropDown/semester](API-teacher-dropDown#endpoint-1242a4e5051e) | 1761 |
| [teacher:GET:/api/dropDown/ssRoomList](API-teacher-dropDown#endpoint-cd4b3b2e50bd) | 1413, 1510 |
| [teacher:GET:/api/dropDown/ssRoomListAll](API-teacher-dropDown#endpoint-6577c818f515) | 1636 |
| [teacher:GET:/api/dropDown/subjectList](API-teacher-dropDown#endpoint-7c6bdb1ead4f) | 1538 |
| [teacher:GET:/api/dropDown/subjectListForAttendance](API-teacher-dropDown#endpoint-5652cb17062c) | 1450 |
| [teacher:GET:/api/dropDown/taskType](API-teacher-dropDown#endpoint-59295894f60c) | 1734, 1759, 1911, 1913 |
| [teacher:GET:/api/dropDown/taskTypeByCourse](API-teacher-dropDown#endpoint-7742ec895d37) | 1819 |
| [teacher:GET:/api/dropDown/tutors](API-teacher-dropDown#endpoint-ce4fd876b243) | 1623 |
| [teacher:GET:/api/grade-book/grade-book](API-teacher-grade-book#endpoint-a0417dae17aa) | 2431, 1763 |
| [teacher:GET:/api/login/schools](API-teacher-login#endpoint-ad501f465b20) | 1160 |
| [teacher:GET:/api/login/switchToken](API-teacher-login#endpoint-7e024c757300) | 1137 |
| [teacher:GET:/api/login/userInfo](API-teacher-login#endpoint-bf9d8d798e04) | 1159 |
| [teacher:GET:/api/message/fromDetail](API-teacher-message#endpoint-4a612c1705c5) | 1707 |
| [teacher:GET:/api/message/fromList](API-teacher-message#endpoint-216da14155cf) | 1701 |
| [teacher:GET:/api/message/toList](API-teacher-message#endpoint-43007f0e7901) | 1611 |
| [teacher:GET:/api/monthly-grade/behavior-table](API-teacher-monthly-grade#endpoint-2c3867cfc86b) | 2125 |
| [teacher:GET:/api/monthly-grade/grade-period](API-teacher-monthly-grade#endpoint-9bbb7884cd60) | 2067 |
| [teacher:GET:/api/monthly-grade/grade-period/{courseId}](API-teacher-monthly-grade#endpoint-642be54909ac) | 2054 |
| [teacher:GET:/api/monthly-grade/gradeTable/{gradePeriodId}/{courseId}](API-teacher-monthly-grade#endpoint-d3a808b0caa2) | 2055 |
| [teacher:GET:/api/monthly-grade/level/attainment](API-teacher-monthly-grade#endpoint-494de21694a1) | 2050 |
| [teacher:GET:/api/monthly-grade/level/effort](API-teacher-monthly-grade#endpoint-20ed1938ce1b) | 2049 |
| [teacher:GET:/api/monthly-grade/report](API-teacher-monthly-grade#endpoint-04a9a0431013) | 2173 |
| [teacher:GET:/api/monthly-grade/report/student-id](API-teacher-monthly-grade#endpoint-6ef7ee248236) | 2172 |
| [teacher:GET:/api/monthly-grade/teachingReview/list](API-teacher-monthly-grade#endpoint-fff3d59dbaf0) | 2068, 2070 |
| [teacher:GET:/api/semester/currentSchoolYear](API-teacher-semester#endpoint-ff61d57df37c) | 1161 |
| [teacher:GET:/api/student/class-info](API-teacher-student#endpoint-3f467212a145) | 2426 |
| [teacher:GET:/api/student/classAndHouse](API-teacher-student#endpoint-e4b5ba412577) | 1171 |
| [teacher:GET:/api/student/detail](API-teacher-student#endpoint-fee79a0f4f95) | 2420 |
| [teacher:GET:/api/student/studentBriefInfo](API-teacher-student#endpoint-7ecc8af24647) | 2418 |
| [teacher:GET:/api/task-grade/rule](API-teacher-task-grade#endpoint-afd6109e095a) | 1793 |
| [teacher:GET:/api/task/detail](API-teacher-task#endpoint-2d88a86f6537) | 1877 |
| [teacher:GET:/api/task/mergeList](API-teacher-task#endpoint-2b105acaf1ac) | 1741, 1914 |
| [teacher:GET:/api/task/performance](API-teacher-task#endpoint-195e4cce8403) | 1878 |
| [teacher:GET:/api/task/student/detail](API-teacher-task#endpoint-2138245c964d) | 2020, 2023 |
| [teacher:GET:/api/teacher/listAll](API-teacher-teacher#endpoint-cd5387f3c228) | 1537 |
| [teacher:POST:/api/diary](API-teacher-diary#endpoint-38975134268e) | 2471 |
| [teacher:POST:/api/message/send](API-teacher-message#endpoint-b5ec8fb92b4f) | 1682 |
| [teacher:POST:/api/monthly-grade](API-teacher-monthly-grade#endpoint-f6a4ffad3036) | 2058 |
| [teacher:POST:/api/monthly-grade/behaviorRecord](API-teacher-monthly-grade#endpoint-21808b7a7459) | 2130, 2131 |
| [teacher:POST:/api/performance/task](API-teacher-performance#endpoint-434b4283fb7a) | 1879 |
| [teacher:POST:/api/student/my-student](API-teacher-student#endpoint-8e14d8735c0d) | 2411 |
| [teacher:POST:/api/student/student-id](API-teacher-student#endpoint-0fa415653e1c) | 2405 |
| [teacher:POST:/api/task/add](API-teacher-task#endpoint-3973589ee0c6) | 1904 |
| [teacher:PUT:/api/attendance/class](API-teacher-attendance#endpoint-8c04aeb16d9e) | 1247, 1249, 1364, 1365 |
| [teacher:PUT:/api/attendance/daily](API-teacher-attendance#endpoint-cd2cd97d9556) | 1353 |
| [teacher:PUT:/api/attendance/ssRoom/update](API-teacher-attendance#endpoint-4cce7e07d01a) | 1419, 1420 |
| [teacher:PUT:/api/message/withdraw](API-teacher-message#endpoint-f7d2704e8238) | 1709 |
| [teacher:PUT:/api/task/updateScore](API-teacher-task#endpoint-93a24c905090) | 2019 |
