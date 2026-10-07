import argparse
import hashlib
import hmac
import secrets
import json
import re
from collections import defaultdict
from pathlib import Path
from urllib.parse import parse_qs, urlsplit

PARSER = argparse.ArgumentParser()
PARSER.add_argument('--captures', type=Path, required=True)
PARSER.add_argument('--scripts', type=Path, required=True)
ARGS = PARSER.parse_args()
ROOT = Path(__file__).resolve().parents[1]
SALT_FILE=ARGS.scripts/'fixture-salt.private'
if not SALT_FILE.exists():SALT_FILE.write_bytes(secrets.token_bytes(32));SALT_FILE.chmod(0o600)
SALT=SALT_FILE.read_bytes()
def pseudonym(value):
    return hmac.new(SALT,str(value).encode(),hashlib.sha256).hexdigest()
def anonymous_id(value):
    return 500000+int(pseudonym(value)[:12],16)%900000000
TIME_SHIFT=(1040+int(pseudonym('time-shift')[:8],16)%520)*7*86400000

MEANINGS = {
 'studentId':'学生标识，来自学生列表或课程学生名单', 'teacherId':'教师标识，来自用户信息或教师列表',
 'schoolId':'学校标识，来自认证学校列表', 'schoolYearId':'学年标识，来自当前学年或学年选项',
 'courseId':'课程标识或课程引用，来自课程选择或课表', 'classArrangeId':'具体课节安排标识，来自考勤或课表',
 'classPeriodId':'课节定义标识，来自课节列表', 'taskId':'任务标识，来自任务列表',
 'taskStudentId':'学生任务关联标识，来自任务列表或任务学生记录', 'gradePeriodId':'成绩周期标识，来自报告周期选项',
 'monthlyGradePeriodId':'月度成绩周期标识，来自月度成绩周期列表', 'leaveApplicationId':'请假申请标识，来自请假记录',
 'reasonId':'请假原因选项标识，来自原因字典', 'primaryTypeId':'日记主类型标识，来自主类型选项',
 'diaryEntryTypeId':'日记子类型标识，来自对应主类型的子类型选项', 'diaryEntryId':'日记记录标识',
 'classId':'主班级标识，来自学生资料或班级选项', 'sectionId':'年级或年段标识，来自年段选项',
 'classRoomId':'教室标识或教室对象，来自教室选项或课表', 'campusId':'学部标识，来自学部选项',
 'attendanceStatusId':'考勤状态字典记录标识', 'attendanceKindId':'考勤状态所属种类标识',
 'pageSize':'分页大小，以记录条数为单位', 'pageCurrent':'页码，从 1 开始', 'totalItem':'满足条件的总记录数',
 'items':'当前页的完整记录', 'name':'中文名称或业务名称，按当前实体解释', 'enName':'英文名称，可能为空',
 'value':'选项值或显示文本；具体角色由所属选项字典决定', 'key':'选项标识，供后续请求使用',
 'enValue':'选项的英文显示文本', 'extraValue':'选项附加元数据，类型随业务域变化',
 'status':'本业务域状态；不能跨业务域套用代码表', 'type':'本业务域类型；不能跨业务域套用代码表',
 'startTime':'开始时刻，Unix 毫秒或端点定义的课节时间', 'endTime':'结束时刻，Unix 毫秒或端点定义的课节时间',
 'startDate':'开始日期或时刻，Unix 毫秒', 'endDate':'结束日期或截止时刻，Unix 毫秒',
 'createTime':'创建时刻，Unix 毫秒', 'modifyTime':'最后修改时刻，Unix 毫秒', 'birthday':'出生日期，Unix 毫秒',
 'date':'业务日期，日期型端点使用 Unix 毫秒', 'start':'区间开始值；日期查询使用 Unix 毫秒',
 'end':'区间结束值；日期查询使用 Unix 毫秒', 'score':'分数；单位及评分方式由任务或成绩规则决定',
 'topScore':'评分上限或统计最高分，依端点业务区分', 'points':'本次行为积分', 'point':'行为积分或记录值',
 'description':'业务说明或富文本内容', 'comment':'备注、评语或考勤说明', 'comments':'评语或备注内容',
 'content':'正文或学生提交内容，可能包含富文本', 'resources':'完整附件资源引用', 'resourceIds':'已上传资源标识',
 'attachments':'附件输入或附件元数据', 'attachment':'已关联附件列表', 'avatarUrl':'头像资源地址',
 'studentNum':'学生学号', 'studentNo':'学生学号', 'studentName':'学生显示姓名', 'firstName':'名字或拼音名',
 'lastName':'姓氏或拼音姓', 'surname':'姓氏', 'moniker':'常用名称', 'displayName':'前端使用的显示名称',
 'email':'邮箱地址', 'mobile':'手机号码，不包含国家区号', 'areaCode':'电话国家或地区区号',
 'gender':'性别语义值', 'isTeach':'当前教师是否具有此选项的教学权限', 'editable':'当前记录是否可编辑',
 'editFlag':'当前记录是否可编辑', 'locked':'当前记录是否已锁定', 'permissions':'此状态或操作的权限标记',
 'show':'是否允许前端显示该选项', 'attend':'是否计为出席', 'colour':'显示颜色', 'color':'显示颜色',
 'abbr':'业务名称缩写', 'code':'本业务域代码，需结合该对象的名称解释', 'subOptions':'下一级完整选项',
 'success':'本次认证或业务操作是否成功', 'resCode':'业务结果代码，与 HTTP 状态码独立',
 'msg':'业务结果说明', 'resMsg':'业务结果说明', 'extraMsg':'业务结果的附加信息',
 'token':'平台会话 Token，敏感认证材料，不应记录', 'schools':'可访问学校列表',
 'classTeacher':'主班教师权限', 'courseTeacher':'课程教师权限', 'courseManager':'课程管理权限',
 'houseTeacher':'学院教师权限', 'houseGroupTeacher':'学院小组教师权限', 'sectionTeacher':'年段教师权限',
 'ccaCourseTeacher':'CCA 教师权限', 'dataPermission':'当前用户的数据权限集合', 'classArranges':'按星期与课节组织的课表',
 'classPeriods':'课节定义列表', 'dayOfArranged':'课表安排日期信息', 'periods':'安排包含的课节定义',
 'targetSections':'课程对应年段集合', 'teachers':'关联教师列表', 'students':'关联学生列表',
 'week':'本次安排所属周信息', 'dayOfWeek':'星期序号', 'originDayOfWeek':'调课前的星期序号',
 'regular':'常规课程安排计数', 'institute':'公共或机构课程安排计数', 'courseList':'常规课程列表',
 'ccaList':'延展课程列表', 'studentResources':'学生提交的附件资源', 'inTotal':'是否计入汇总成绩',
 'online':'是否线上提交或线上状态', 'scoreFlag':'是否启用评分', 'overDeadline':'是否已超过截止时间',
 'isRead':'当前条目是否已读', 'publicFlag':'是否公开或发布', 'canEditType':'是否允许编辑任务类型',
 'typeName':'业务类型名称', 'courseType':'课程类别，区别常规课程和 CCA', 'subjectName':'学科名称',
 'courseName':'课程名称', 'courseScheduleName':'课程教学班名称', 'teacherNames':'关联教师名称文本',
 'className':'主班级名称', 'sectionName':'年段名称', 'sectionEnName':'年段英文名称',
 'reason':'请假原因说明或课程离班说明', 'reasonName':'请假原因选项中文名称', 'reasonEnName':'请假原因选项英文名称',
 'declineReason':'审批拒绝原因', 'approveReply':'审批回复', 'auditor':'审批人员显示信息',
 'durationInDays':'请假时长，以天为单位', 'leaveInfo':'关联请假信息', 'attendanceTypes':'允许的考勤时段或模式',
 'dailySession':'日常考勤时段', 'dormitorySession':'宿舍考勤时段', 'dailyStatistics':'按日期组织的考勤记录',
 'kinds':'统计使用的考勤状态字典', 'statistics':'按业务维度聚合的统计', 'attendances':'考勤记录或统计映射',
 'am':'上午考勤', 'pm':'下午考勤', 'eve':'晚间考勤', 'amcomment':'上午考勤备注',
 'pmcomment':'下午考勤备注', 'evecomment':'晚间考勤备注', 'currentPeriod':'当前课节显示名称',
 'lastPeriod':'上一课节显示名称', 'meanMap':'成绩字段到平均数的映射', 'medianMap':'成绩字段到中位数的映射',
 'gradeItems':'完整成绩列或报告成绩项目', 'customColumns':'自定义成绩列', 'gradeBookItems':'按课程组织的成绩簿项目',
 'gradeMap':'按成绩列标识组织的学生成绩', 'taskScores':'任务成绩列表', 'customColumnScores':'自定义列成绩',
 'gradeLevelItems':'等级评分定义', 'effort':'努力程度等级或等级对象', 'attainment':'学业达成等级或等级对象',
 'percentage':'百分制成绩', 'examPercentage':'考试百分制成绩', 'level':'成绩等级名称',
 'tag':'评分备注标签，需按评分业务解析', 'housePoint':'学院积分', 'conductPoint':'行为积分',
 'housePoints':'学院积分汇总', 'conductPoints':'行为积分汇总', 'houseAchievements':'学院表现说明',
 'behaviourEvents':'行为事件说明', 'houseAchievement':'学院表现说明', 'behaviourEvent':'行为事件说明',
 'gradePeriod':'完整报告周期配置', 'reportType':'报告类别', 'templateId':'报告模板标识',
 'requestUrl':'报告请求地址或路径', 'teachingContent':'教学内容', 'keyWords':'教学关键词',
 'month':'报告月份', 'schoolYear':'所属学年显示文本或选项对象', 'house':'学院名称', 'tutor':'辅导师显示信息',
 'grade':'年级名称或成绩等级，按所在业务解释', 'headTeacher':'主班教师信息或启用标记',
 'tutorComments':'辅导师评语', 'headTeacherComments':'主班教师评语', 'deputyComment':'副负责人评语',
 'attendanceInfo':'报告附带的完整考勤统计', 'calendarDays':'日历日期配置', 'eventList':'日历事件列表',
 'groupLabel':'选项分组显示名称', 'list':'该分组的完整选项', 'boarding':'是否寄宿',
 'schoolBus':'是否乘坐校车', 'relationship':'家长与学生的关系', 'relation':'账号与学生的关系',
 'isMajor':'是否主要联系人', 'parentId':'家长标识', 'parentsEmail':'家长邮箱列表',
 'studentEmail':'学生邮箱', 'parentEmail':'家长邮箱显示文本', 'myStudent':'是否属于当前教师负责学生',
 'inSchool':'是否筛选在校学生', 'isTeacher':'是否关联教师身份', 'isExam':'是否考试类型',
 'publishStudent':'是否向学生发布', 'publishParent':'是否向家长发布', 'inClass':'是否仍在此课程班级',
 'entityId':'混合列表实体标识；任务条目与教学资源条目的标识语义不同', 'unHandInNum':'未提交任务数',
 'handInTime':'学生提交时刻，Unix 毫秒', 'reSubmit':'是否允许再次提交', 'entry':'关联记录或业务条目',
 'primaryType':'日记主类型中文名称', 'primaryTypeEn':'日记主类型英文名称',
 'diaryEntryType':'日记子类型中文名称', 'diaryEntryTypeEn':'日记子类型英文名称',
 'messageMasterId':'消息主记录标识，来自消息列表', 'masterRecordId':'消息收发关联记录标识',
 'sendTime':'消息发送时刻，Unix 毫秒', 'sendMail':'是否同时发送邮件', 'withdraw':'消息是否已撤回',
 'canDelete':'当前账号是否可删除此收发记录', 'selfDelete':'当前账号是否已删除此收发记录',
 'fromMember':'发送方完整信息', 'toMember':'接收方完整信息', 'toMembers':'接收方完整列表',
 'toTeachers':'教师接收方', 'toStudents':'学生接收方', 'toParents':'家长接收方',
 'title':'消息或公告标题', 'subject':'学科对象或名称', 'course':'完整关联课程对象',
 'data':'完整业务数据；结构由当前端点决定', 'studentNum':'学生学号或统计学生数量，依端点区分',
 'seqNum':'当前列表显示序号', 'id':'当前业务实体标识', 'name':'业务实体或选项名称',
 'username':'门户登录账号', 'password':'密码字段；响应中通常为空，不应持久化或记录',
 'userId':'门户用户标识', 'tenantId':'门户租户标识', 'authorities':'门户角色权限列表',
 'appsAuth':'门户可使用的应用标识', 'ssoStatus':'SSO 是否可用', 'authority':'单项权限标识',
 'accountNonExpired':'账号是否未过期', 'accountNonLocked':'账号是否未锁定', 'credentialsNonExpired':'凭据是否未过期'
}

MEANINGS.update({
 'classRoom':'教室名称或完整教室对象，来自教室配置', 'teacherName':'教师显示名称', 'teacherEnName':'教师英文显示名称',
 'enterDate':'入学日期，Unix 毫秒', 'outDate':'离校日期，Unix 毫秒；未离校可为空', 'editAble':'当前记录是否可编辑，保留服务端拼写',
 'noRecords':'未考勤记录或未考勤数量，依所在统计节点区分', 'intime':'出席记录或出席数量', 'personal':'可谅解缺席记录或数量',
 'absent':'缺席记录或数量', 'illness':'病假记录或数量', 'weekendHoliday':'假期记录或数量',
 'count':'当前状态或维度的记录数量', 'countNum':'当前节点记录数量', 'countIn':'是否纳入成绩计算', 'countInCalculation':'是否纳入成绩计算',
 'rate':'服务器返回的统计比率；刻度由业务规则决定，不自动换算', 'allNums':'统计范围内总记录数量',
 'attendantNums':'统计范围内出勤记录数量', 'attendantRate':'出勤比率，按服务器统计规则解释',
 'dimension':'统计维度中文名称', 'enDimension':'统计维度英文名称', 'statisticDetail':'此维度的完整统计明细',
 'subjectId':'学科标识，来自学科选项或课程配置', 'teacher':'完整教师对象或教师显示信息', 'campusName':'学部名称',
 'sectionCampusId':'年段所属学部标识', 'memberId':'当前消息成员标识，需结合 memberType 解释', 'memberType':'消息成员身份类别',
 'isFullPeriodArranged':'是否安排完整课节', 'sevenFive':'未确认语义的课节配置标记，保留上游值', 'isSubstitute':'是否代课安排',
 'dormitoryName':'宿舍显示名称', 'houseName':'学院名称', 'selfStudyRoomName':'自习室显示名称', 'taskTypeId':'任务类型标识，来自任务类型选项',
 'deputyHead':'副负责人完整资料或周期是否启用副负责人评语', 'address':'联系地址', 'schoolRollNote':'学籍说明', 'schoolRollStatus':'学籍状态，具体字典尚未完整确认',
 'courseFlag':'课程筛选或课程功能标记，按所属接口解释', 'dormitoryAttendanceFlag':'是否启用宿舍考勤', 'dormitoryAttendances':'完整宿舍考勤数据',
 'studyRoomAttendanceFlag':'是否启用自习室考勤', 'studyRoomAttendances':'完整自习室考勤数据', 'courseScheduleId':'课程教学安排标识，来自课程安排',
 'creator':'创建者显示信息', 'creatorName':'创建者姓名', 'ep':'成绩周期的考试百分比项目配置', 'hc':'成绩周期的学院或行为积分项目配置',
 'countryName':'国家中文名称', 'countryEnName':'国家英文名称', 'countryId':'国家选项标识',
 'houseGroupId':'学院小组标识，来自学院小组选项', 'houseGroupName':'学院小组名称', 'houseGroup':'完整学院小组或小组显示文本',
 'houseGroups':'学院小组集合', 'houseId':'学院标识，来自学院选项', 'academy':'所属学院显示名称',
 'customColumnId':'自定义成绩列标识，来自成绩簿列配置', 'customColumnName':'自定义成绩列名称', 'columnId':'成绩列标识，来自列配置',
 'calculatedLevel':'按评分规则计算的等级', 'calculatedScore':'按评分规则计算的分数', 'manual':'是否手动录入此项目',
 'manualPass':'手动设置的通过标记', 'scoreMethod':'评分方式，按本业务域解释', 'taskTypeName':'任务类型名称',
 'isCCA':'是否延展课程', 'classPeriodName':'课节显示名称', 'classRoomName':'教室显示名称',
 'medical':'医疗说明，属于敏感资料', 'medicalTag':'是否有医疗提示', 'medium':'授课语言或相关提示文本', 'mediumTag':'是否有语言提示标记',
 'relationId':'关系选项标识', 'relationName':'关系显示名称', 'relationShip':'家长与学生的关系，保留服务端拼写',
 'dormitory':'完整宿舍对象或宿舍名称', 'gradedNum':'已评分学生数量', 'lastClassDate':'最后参与课程日期，Unix 毫秒',
 'courseCredit':'课程学分', 'courseLeaveReasonId':'离开课程原因标识，来自课程原因选项', 'courseRecordId':'学生课程记录标识',
 'creditAvailable':'是否允许授予学分', 'creditSet':'是否已设置学分', 'leaveReason':'课程离班原因中文名称', 'leaveEnReason':'课程离班原因英文名称',
 'reportView':'是否允许查看该报告', 'classTypeName':'班级种类名称', 'tutorTeachers':'辅导师集合',
 'bedId':'床位标识，来自宿舍床位配置', 'bedName':'床位显示名称', 'building':'完整楼栋对象或名称', 'floorList':'楼层列表',
 'busRoutName':'校车路线中文名称，保留服务端拼写', 'busRoutEnName':'校车路线英文名称，保留服务端拼写', 'busRoute':'完整校车路线信息',
 'busSite':'完整校车站点信息', 'busSiteName':'校车站点中文名称', 'busSiteEnName':'校车站点英文名称',
 'canLogin':'此账号是否允许登录', 'idNum':'身份证件号码，敏感资料', 'idType':'身份证件种类，未知代码保持未识别',
 'enterYear':'入学年份或学年文本', 'selfStudyRoomId':'自习室标识，来自自习室配置', 'siblings':'兄弟姐妹关联信息', 'haveSiblings':'是否有兄弟姐妹关联',
 'customColumnScore':'自定义列分数', 'taskName':'任务显示名称', 'lastComment':'上次考勤备注', 'lastStatus':'上次考勤状态',
 'realCode':'上游实际业务编码，含义依实体区分', 'subjects':'关联学科列表', 'semesterId':'学期标识，来自学期选项',
 'logoUrl':'学校公开标志资源地址', 'shortName':'学校或机构简称', 'domain':'家长入口域名，用于匹配公开学校配置', 'tel':'联系电话',
 'selfStudyRoom':'完整自习室对象或名称', 'reported':'此周期是否已发布报告', 'graduateTime':'毕业时刻，Unix 毫秒',
 'firstSemStartDate':'第一学期开始日期，Unix 毫秒', 'firstSemEndDate':'第一学期结束日期，Unix 毫秒',
 'secondSemStartDate':'第二学期开始日期，Unix 毫秒', 'secondSemEndDate':'第二学期结束日期，Unix 毫秒',
 'thirdSemStartDate':'第三学期开始日期，Unix 毫秒', 'thirdSemEndDate':'第三学期结束日期，Unix 毫秒', 'lastDate':'最后关联日期，Unix 毫秒',
 'creditEditFlag':'是否允许编辑学分', 'gradePeriodName':'报告周期名称', 'subjectClass':'完整学科班级信息', 'campus':'完整学部对象',
 'deputyHeadId':'副负责人标识，来自教师配置', 'teachingReview':'课程教学回顾内容', 'openId':'外部账号关联标识，敏感资料',
 'position':'家长或成员职位', 'workUnit':'家长或成员工作单位', 'classAttendance':'是否具备课节考勤权限', 'dailyAttendance':'是否具备日常考勤权限',
 'dormitoryAttendance':'是否具备宿舍考勤权限', 'lbAttendance':'是否具备延展课程考勤权限', 'ssrAttendance':'是否具备自习室考勤权限',
 'full_day':'全日考勤记录或统计节点', 'sessionAttendances':'按考勤时段组织的完整记录', 'detailedName':'完整展开显示名称',
 'sortNum':'显示排序序号', 'arranged':'是否已安排', 'gradeLevelId':'评分等级标识，来自等级配置', 'gradeLevelName':'评分等级名称',
 'openSchoolYear':'是否开放此学年', 'semesters':'完整学期集合', 'tas':'课程助教集合', 'cardNum':'学生卡号，敏感资料',
 'classMaterialId':'教学资源标识，来自混合资源列表', 'curriculumId':'课表安排标识，来自课表记录', 'confidential':'是否保密记录',
 'followUpDate':'后续跟进日期，Unix 毫秒', 'modifier':'最后修改者显示信息', 'notice':'是否启用服务端通知标记',
 'removeFlag':'记录是否已删除', 'responseList':'完整响应记录集合', 'diaryEntryItemResponsePagedList':'日记记录的分页集合',
 'diaryEntryStatistics':'日记积分或行为统计', 'diaryIds':'关联日记标识集合', 'icons':'类型关联图标',
 'negativePoints':'负向行为积分', 'notePoints':'备注类记录积分', 'positivePoints':'正向表现积分', 'studentAvatar':'学生头像资源地址',
 'disable':'是否禁用该选项', 'lowPoints':'此日记主类型的积分下限', 'highPoints':'此日记主类型的积分上限', 'special':'是否需要特殊日记字段',
 'schoolYearName':'学年显示名称', 'canColumnLock':'是否允许锁定成绩列', 'columnType':'成绩列类别，按成绩簿业务解释',
 'itemId':'当前成绩项目标识', 'publishTeacher':'是否向教师发布', 'studentJoin':'是否有学生参与', 'taskRuleId':'任务评分规则标识',
 'submitted':'当前记录是否已提交', 'studentEnName':'学生英文显示姓名', 'studentFirstName':'学生名字或拼音名', 'studentLastName':'学生姓氏或拼音姓',
 'taskGradeLevelId':'任务评分等级标识', 'classAtten':'课节考勤摘要', 'higSchoolCcaTeacher':'高中延展课程教师权限，保留服务端拼写',
 'readNum':'已读收件人数量', 'important':'是否重要消息', 'messageId':'消息记录标识', 'readFlag':'当前记录是否已读',
 'advisory':'辅导或学院分组显示名称', 'schoolYearConductPoint':'当前学年行为积分', 'schoolYearHousePoint':'当前学年学院积分',
 'commentedNum':'已填写评语数量', 'courseNum':'课程数量', 'deputyHeadCommentNum':'已填写副负责人评语数量',
 'epGradedNum':'已录入考试百分比成绩数量', 'headTeacherCommentedNum':'已填写主班教师评语数量', 'headTeacherNum':'主班教师数量',
 'sent':'是否已发送', 'tutorCommentedNum':'已填写辅导师评语数量', 'tutorNum':'辅导师数量', 'classList':'班级列表', 'houseList':'学院列表',
 'selfStudyRoomList':'自习室列表', 'realStatus':'上游实际状态，须按所属业务解释', 'taskType':'任务类型对象或名称',
 'rules':'完整业务规则配置', 'allNum':'统计总数量', 'openFlag':'是否开放', 'parentNum':'关联家长数量',
 'parentReadNum':'家长已读数量', 'studentReadNum':'学生已读数量', 'submitNum':'已提交数量', 'borders':'寄宿学生数量，保留服务端拼写',
 'unBorders':'非寄宿学生数量，保留服务端拼写', 'females':'女生数量', 'males':'男生数量', 'higher':'统计区间上限', 'lower':'统计区间下限',
 'label':'显示标签', 'num':'当前节点数量', 'avgScore':'平均分', 'lowestScore':'最低分', 'graduateTo':'毕业去向文本',
 'graduateYear':'毕业年份', 'section':'完整年段对象', 'toSchool':'转学目标学校文本', 'transReasonName':'转学原因名称',
 'transRemark':'转学说明', 'zhName':'中文显示名称'
})
for prefix,label in [('city','城市'),('province','省份'),('district','地区')]:
    MEANINGS.update({prefix+'Code':label+'选项编码',prefix+'Name':label+'中文名称',prefix+'EnName':label+'英文名称'})
for prefix,label in [('domicileCity','户籍城市'),('domicileDistrict','户籍地区'),('domicileProvince','户籍省份')]:
    MEANINGS.update({prefix:label+'编码',prefix+'Name':label+'名称'})
MEANINGS['domicileAddress']='户籍地址，敏感资料'
for suffix,label in [('AM','上午'),('PM','下午'),('EVE','晚间')]:
    for prefix,meaning in [('editAble','是否可编辑'),('editable','是否可编辑'),('editFlag','是否可编辑'),('locked','是否已锁定'),('comment','考勤备注')]:
        MEANINGS[prefix+suffix]=label+meaning

def http(p):
    text = p.read_text(errors='replace').replace('\r\n', '\n')
    head, _, body = text.partition('\n\n')
    lines = head.splitlines()
    headers = {}
    for line in lines:
        m = re.match(r'^(:[^:]+|[^:]+):\s*(.*)$', line)
        if m: headers[m[1].lower()] = m[2]
    return headers.get(':method', lines[0].split()[0]), headers.get(':path', lines[0].split()[1]), headers.get(':authority', headers.get('host','')).removesuffix(':443'), headers, body

def normalize(path):
    if re.match(r'/api/(curriculum|attendance/statistic)/student/(detail/|ele/)?\d+$', path):
        return re.sub(r'\d+$', '{schoolYearId}', path)
    if re.match(r'/api/monthly-grade/gradeTable/\d+/\d+$', path):
        return '/api/monthly-grade/gradeTable/{gradePeriodId}/{courseId}'
    if re.match(r'/api/monthly-grade/grade-period/\d+$', path):
        return '/api/monthly-grade/grade-period/{courseId}'
    return path.rstrip('/') or '/'

def pascal(s):
    return ''.join(x[:1].upper()+x[1:] for x in re.findall(r'[A-Za-z0-9]+', s)) or 'Root'

def member(s):
    if s in {'class','case','repeat','default','switch','extension','protocol','typealias','private','public','internal','in','where','return','self','operator','subscript','import','let','var','func','enum','struct','associatedtype','init','deinit','is','as','try','throws'}: return '`'+s+'`'
    return s if re.fullmatch('[A-Za-z_][A-Za-z0-9_]*',s) else 'field'+pascal(s)

def schema(values):
    values = [v for v in values if v is not None]
    if not values: return {'kind':'json'}
    types = set(type(v) for v in values)
    if types <= {int,float}: return {'kind':'double' if float in types else 'int'}
    if types == {bool}: return {'kind':'bool'}
    if types == {str}: return {'kind':'string'}
    if types == {list}:
        return {'kind':'array','item':schema([x for v in values for x in v])}
    if types != {dict}: return {'kind':'json'}
    keys = set(k for v in values for k in v)
    if keys and (all(re.search(r'\d| ',k) and not re.fullmatch('[A-Za-z_][A-Za-z0-9_]*',k) for k in keys) or all(re.fullmatch(r'(?:task|cus|col|grade|g)_\d+',k) for k in keys) or all(k.isdigit() for k in keys) or all(re.fullmatch(r'(?:Period \d+|CCA\d+)',k) for k in keys)):
        return {'kind':'map','item':schema([x for v in values for x in v.values()])}
    return {'kind':'object','fields':{k:{'schema':schema([v[k] for v in values if k in v]),'optional':any(k not in v or v[k] is None for v in values)} for k in sorted(keys)}}

def semantic_domain(path, field):
    if field=='status' and any(x in path for x in ['/student/','/message/receiver']):return 'studentStatus'
    if field=='classType':return 'classType'
    if field=='gender':return 'gender'
    if field in {'relationship','relation','relationShip'}:return 'relationship'
    if field=='semesterType':return 'semesterType'
    if field=='status' and '/semester' in path:return 'semesterStatus'
    if field=='status' and '/leave-application' in path:return 'leaveStatus'
    if field=='status' and '/attendance/' in path:return 'attendanceStatus'
    if field=='type' and '/calendar/' in path:return 'calendarDayType'
    if field=='type' and '/curriculum/' in path:return 'curriculumType'
    if field=='type' and '/task/mergeList' in path:return 'taskFeedType'
    if field=='courseType' or (field=='type' and '/relatedAllCourses' in path):return 'courseType'
    if field=='campusType':return 'campusType'
    if field=='attendanceType':return 'attendanceType'
    if field=='scoreMethod' or field=='gradeType':return 'gradeType'
    if field=='lastStatus':return 'attendanceStatus'
    if field=='type' and '/leave-application' in path:return 'leaveKind'
    if field=='idType':return 'identityDocumentType'
    if field in {'status','type','reportType','tag'}:return 'unconfirmed:'+path+':'+field
    return None

def scrub(value, key='', semantic=False):
    if isinstance(value,dict):
        def scrub_key(k):
            if k.isdigit() and int(k)>7:return str(anonymous_id(k))
            m=re.fullmatch(r'(task|cus|col|grade|g)_(\d+)',k)
            return m[1]+'_'+str(anonymous_id(m[2])) if m else k
        return {scrub_key(k):scrub(v,k,semantic) for k,v in value.items()}
    if isinstance(value,list): return [scrub(v,key,semantic) for v in value]
    if value is None or isinstance(value,bool):return value
    if isinstance(value,(int,float)):
        if key.lower().endswith('id') or key in {'entityId','key'}:return anonymous_id(value)
        if value>100000000000:return value-TIME_SHIFT
        if key in {'score','points','point','percentage','examPercentage','avgScore','lowestScore'}:return 1 if isinstance(value,int) else 1.5
        return value
    if key in {'pageCurrent','pageSize','currentPage','totalPage','pageCount','month','year','week','weekNo','weekday','allType','show','enabled','editable','locked'} and (re.fullmatch(r'-?\d+(?:\.\d+)?',value) or value in {'true','false'}):return value
    if key in {'token','accessToken','access_token'}:return 'fixture-session-token'
    if key in {'password','vcode'}:return 'fixture-'+key
    if key.lower().endswith('id') and value.isdigit():return str(anonymous_id(value))
    if key in {'status','type','code','classType','campusType','attendanceType','semesterType','reportType','gender','tag','relation','relationship','relationShip','scoreMethod','courseType','schoolRollStatus','ssoStatus'}:return value
    if key in {'start','end','startTime','endTime','time','date'} and value.isdigit() and int(value)>100000000000:return str(int(value)-TIME_SHIFT)
    if key in {'start','end','startTime','endTime','time','date','enterYear'} and re.fullmatch(r'[0-9:/ -]*',value):return value
    if not value:return value
    if semantic and key in {'name','enName','value','enValue','abbr'}:return value
    digest=pseudonym(value)[:8]
    if 'email' in key.lower():return 'person-'+digest+'@example.invalid'
    if 'url' in key.lower() or value.startswith(('http:','https:')):return 'https://example.invalid/resource/'+digest
    if key in {'msg','resMsg'}:return value
    return '示例文本-'+digest

def dependency(k):
    return MEANINGS.get(k, '来自同业务域上游选项或记录；未确认的关联须通过实验入口使用')

def safety(platform, method, path, captured=False):
    if '/login/' in path or path in {'/api/login','/api/oauth/authorize'}:
        return 'externalEffect' if 'vcode' in path.lower() or any(x in path for x in ['resetPassword','addQRCode','firstLogin']) else 'authentication'
    if method != 'GET':
        if path in {'/api/performance/task','/api/student/my-student','/api/student/student-id','/api/attendance/leave-application/time-check'}:return 'readOnly' if captured else 'unverified'
        return 'externalEffect'
    if any(x in path.lower() for x in ['vcode','setread','increase-share','verify/mobile','verify/email','save','sign','qiniutoken','preview-token']):return 'unverified'
    return 'readOnly' if captured else 'unverified'

captures=defaultdict(list)
for p in sorted(ARGS.captures.rglob('*.txt')):
    if '] Request - ' not in p.name:continue
    method,target,host,headers,body=http(p)
    platform='parent' if host.startswith('pcd.') else 'teacher' if host.startswith('teacher.') else 'portal' if host.startswith('kcschengdu.') else 'print'
    url=urlsplit(target);path=normalize(url.path)
    _,_,_,_,response=http(p.with_name(p.name.replace('] Request - ','] Response - ')))
    try:request=json.loads(body) if body.strip() else None
    except json.JSONDecodeError:request={k:v[0] for k,v in parse_qs(body,keep_blank_values=True).items()}
    try:response=json.loads(response) if response.strip() else None
    except json.JSONDecodeError:response=None
    captures[(platform,method,path)].append({'number':re.search(r'\[(\d+)\]',p.name)[1], 'actualPath':url.path,'query':parse_qs(url.query,keep_blank_values=True),'request':request,'response':response})

sources=json.loads((ARGS.scripts/'sources.json').read_text())
definitions=defaultdict(list)
for source in sources:
    if 'file' not in source or source['platform']=='portal':continue
    text=Path(source['file']).read_text(errors='replace')
    if source['platform']=='parent' and 'chunk-common' not in source['file']:continue
    if source['platform']=='teacher' and not re.search(r'teacher-app\.',source['file']):continue
    for m in re.finditer(r'\{key:"([^"]+)",value:function\([^)]*\)\{',text):
        start=m.end();i=start;depth=1;quote=None;escape=False
        while i<len(text) and depth:
            c=text[i]
            if quote:
                if escape:escape=False
                elif c=='\\':escape=True
                elif c==quote:quote=None
            elif c in {'"',"'",'`'}:quote=c
            elif c=='{':depth+=1
            elif c=='}':depth-=1
            i+=1
        expression=text[start:i-1]
        call=re.search(r'\.(get|post|put|delete|patch)\("(/[^"]*)"',expression)
        if not call:continue
        method=call[1].upper();path='/api'+call[2]
        if path=='/api/':continue
        key=(source['platform'],method,path)
        definitions[key].append({'name':m[1],'expression':expression,'url':source['url']})

catalog=[];field_catalog={};constants={'parent':[],'teacher':[]};fixture_index=[]
generated=ROOT/'Sources/IntCopilotCore/Generated'
def write_generated(platform,filename,text):
    directory=generated/('Endpoints' if filename.endswith('Endpoints.swift') else 'Models')/pascal(platform)
    directory.mkdir(parents=True,exist_ok=True)
    (directory/filename).write_text(text)
for p in generated.rglob('*.swift'):p.unlink()

def swift_model(s, name, path):
    declarations=[]
    used=set()
    def build(node, hint, field=None):
        kind=node['kind']
        domain=semantic_domain(path,field or '')
        if domain and kind in {'string','int'}:return 'SemanticValue',domain
        if kind in {'int','double','bool','string','json'}:return {'int':'Int','double':'Double','bool':'Bool','string':'String','json':'JSONValue'}[kind],None
        if kind in {'array','map'}:
            t,d=build(node['item'],hint+'Item')
            return ('['+t+']' if kind=='array' else '[String: '+t+']'),None
        n=hint;index=2
        while n in used:n=hint+str(index);index+=1
        used.add(n)
        properties=[];decode=[];encode=[];fields=[]
        for k,v in node['fields'].items():
            t,d=build(v['schema'],n+pascal(k),k);optional=v['optional'];typ=t+('?' if optional else '')
            meaning=MEANINGS.get(k,'服务端 '+k+' 字段；完整业务含义尚未确认，保留其完整结构')
            if optional:meaning+='；允许为空或缺失'
            properties += ['    /// '+meaning+'。','    public let '+member(k)+': '+typ]
            fields.append({'field':k,'type':typ,'meaning':meaning,'semanticDomain':d})
            key='JSONKey('+json.dumps(k,ensure_ascii=False)+')'
            if d:
                call='try container.decode'+('IfPresent' if optional else '')+'(JSONValue.self, forKey: '+key+')'
                assignment='('+call+').map { SemanticValue.decoded(rawValue: $0, domain: '+json.dumps(d)+', decoder: decoder) }' if optional else 'SemanticValue.decoded(rawValue: '+call+', domain: '+json.dumps(d)+', decoder: decoder)'
            else:assignment='try container.decode'+('IfPresent' if optional else '')+'('+t+'.self, forKey: '+key+')'
            decode.append('        self.'+member(k)+' = '+assignment)
            value='self.'+member(k)+'.map(\\.rawValue)' if d and optional else 'self.'+member(k)+'.rawValue' if d else 'self.'+member(k)
            encode.append('        if presentFields.contains('+json.dumps(k)+') { try container.encode('+value+', forKey: '+key+') }')
        known='Set<String>(['+', '.join(json.dumps(k,ensure_ascii=False) for k in node['fields'])+'])'
        source='public struct '+n+': CapturedResponse {\n'+'\n'.join(properties)+'\n    /// 未在当前模型中定义的服务器字段，完整保留以支持契约演进。\n    public let additionalFields: [String: JSONValue]\n    /// 原始响应实际包含的字段，用于保留缺失与显式 null 的区别。\n    public let presentFields: Set<String>\n\n    public init(from decoder: any Decoder) throws {\n        let container = try decoder.container(keyedBy: JSONKey.self)\n'+'\n'.join(decode)+'\n        presentFields = Set(container.allKeys.map(\\.stringValue))\n        let known = '+known+'\n        additionalFields = try Dictionary(uniqueKeysWithValues: container.allKeys.filter { !known.contains($0.stringValue) }.map { ($0.stringValue, try container.decode(JSONValue.self, forKey: $0)) })\n    }\n\n    public func encode(to encoder: any Encoder) throws {\n        var container = encoder.container(keyedBy: JSONKey.self)\n'+'\n'.join(encode)+'\n        for (key, value) in additionalFields { try container.encode(value, forKey: JSONKey(key)) }\n    }\n}\n'
        declarations.append(source);field_catalog[n]=fields
        return n,None
    type_name,_=build(s,name)
    if type_name!=name:declarations.append('public typealias '+name+' = '+type_name+'\n')
    return 'import Foundation\n\n'+'\n'.join(declarations)

allkeys=sorted(captures)
for platform,method,path in allkeys:
    records=captures[(platform,method,path)]
    base=pascal(platform)+pascal(path.removeprefix('/api/'))+pascal(method)
    response_name=base+'Response'
    query=sorted(set(k for r in records for k in r['query'] if k!='t'))
    body=sorted(set(k for r in records if isinstance(r['request'],dict) for k in r['request']))
    values=[r['response'] for r in records if r['response'] is not None]
    schema_value=schema(values)
    if not values:
        write_generated(platform,response_name+'.swift','import Foundation\n\npublic typealias '+response_name+' = MutationAcknowledgement\n')
    else:write_generated(platform,response_name+'.swift',swift_model(schema_value,response_name,path))
    operation_id=platform+':'+method+':'+path
    equivalent=[]
    for key,defs in definitions.items():
        if key[0]==platform and key[1]==method and (key[2]==path or (path.startswith(key[2]) and '{' in path)):
            equivalent.extend(defs)
    info={'id':operation_id,'platform':platform,'name':equivalent[0]['name'] if equivalent else pascal(path.removeprefix('/api/')),
          'method':method,'path':path,'stability':'stable' if platform in {'parent','teacher'} and not '/login/' in path and not (platform=='teacher' and path=='/api/attendance/leave-application/pending') else 'unstable',
          'safety':safety(platform,method,path,True),'hasExternalSideEffects':safety(platform,method,path,True)=='externalEffect','safetyConfirmed':safety(platform,method,path,True)!='unverified','expectsJSONBody':method in {'POST','PUT','PATCH'} and any(r['request'] is not None for r in records),'coveredByProvidedCaptures':True,
          'evidence':[{'kind':'providedCapture','reference':'capture:'+r['number']} for r in records]+[{'kind':'frontendScript','reference':d['url']} for d in equivalent[:1]],
          'queryParameters':query,'bodyFields':body,'bodyFieldTypes':{k:schema([r['request'][k] for r in records if isinstance(r['request'],dict) and k in r['request']])['kind'] for k in body},'dependencies':{k:dependency(k) for k in query+body+re.findall(r'\{([^}]+)\}',path)},
          'warnings':['仅观察到空列表的元素结构时，保留 JSONValue；未推断不存在的字段。'] if any(r['response']==[] for r in records) else [],
          'requestExpression':equivalent[0]['expression'] if equivalent else None}
    if platform=='teacher' and path=='/api/attendance/leave-application/pending':info['warnings'].append('原始响应仅包含空 items，待审批记录字段未确认，不稳定接口。')
    if '/login/' in path:info['warnings'].append('认证端点由专用登录流程管理，不应通过通用业务调用执行。')
    catalog.append(info)
    if platform in constants and info['stability']=='stable':constants[platform].append((member(base[len(pascal(platform)):][:1].lower()+base[len(pascal(platform))+1:]),response_name,operation_id))
    for r in records:
        if r['response'] is None:continue
        dictionary='/attendance/attendance-status' in path or '/dropDown/leave-reasons' in path or '/diary/entry-type' in path or '/diary/primary-type' in path
        fixture=scrub(r['response'],semantic=dictionary)
        filename=platform+'-'+r['number']+'.json'
        (ROOT/'Tests/IntCopilotCoreTests/Fixtures'/filename).write_text(json.dumps(fixture,ensure_ascii=False,indent=2)+'\n')
        fixture_index.append({'file':filename,'responseType':response_name,'endpoint':operation_id})

captured_ids={x['id'] for x in catalog}
for (platform,method,path),defs in sorted(definitions.items()):
    if platform+':'+method+':'+path in captured_ids or any(k[0]==platform and k[1]==method and k[2].startswith(path) and '{' in k[2] for k in captures):continue
    d=defs[0]
    dynamic=bool(re.search(r'\.concat\(|\+\s*\w',d['expression'].split(',Object')[0]))
    if dynamic:path+='{'+'pathSuffix'+'}'
    query=sorted(set(re.findall(r'\b([A-Za-z][A-Za-z0-9_]*):',d['expression'].split('params:',1)[1]))) if 'params:' in d['expression'] else []
    query=[k for k in query if k not in {'params','headers','responseType'}]
    warning=['用户原始抓包未覆盖；不稳定接口。','完整请求或响应契约尚未确认，mock 不代表真实行为已验证。']
    s=safety(platform,method,path)
    if s=='unverified':warning.append('安全性未确认，禁止用于自动真实测试。')
    if s=='externalEffect':warning.extend(['具有外部副作用；真实测试须逐项获得许可。','安全性未完整确认，禁止用于自动真实测试。'])
    if dynamic:warning.append('动态路径参数来自前端表达式；pathSuffix 的完整语义仍需确认。')
    catalog.append({'id':platform+':'+method+':'+path,'platform':platform,'name':d['name'],'method':method,'path':path,'stability':'unstable','safety':s,'hasExternalSideEffects':True if s=='externalEffect' else None,'safetyConfirmed':False,'expectsJSONBody':method in {'POST','PUT','PATCH'},'coveredByProvidedCaptures':False,'evidence':[{'kind':'frontendScript','reference':x['url']} for x in defs],'queryParameters':query,'bodyFields':[],'bodyFieldTypes':{},'dependencies':{k:dependency(k) for k in query},'warnings':warning,'requestExpression':d['expression']})

validation=json.loads((ROOT/'Docs/ValidationReport.json').read_text())
for observation in validation['readOnlyObservations']:
    info=next(x for x in catalog if x['id']==observation['endpoint'])
    info.update({'stability':'stable','safety':'readOnly','safetyConfirmed':True,'hasExternalSideEffects':False,'warnings':['用户原始抓包未覆盖；经补充只读实测确认的引导或上下文接口。']})
    info['evidence'].append({'kind':'readOnlyObservation','reference':observation['reference']})
    data_file=ARGS.scripts/('observation-parent-'+info['path'].split('/')[-1]+'.private.json')
    filename='supplemental-parent-'+info['path'].split('/')[-1]+'.json'
    public_fixture=ROOT/'Tests/IntCopilotCoreTests/Fixtures'/filename
    if data_file.exists() or public_fixture.exists():
        is_private=data_file.exists()
        data=json.loads((data_file if is_private else public_fixture).read_text())
        response_name='Parent'+pascal(info['path'].removeprefix('/api/'))+'GETResponse'
        write_generated('parent',response_name+'.swift',swift_model(schema([data]),response_name,info['path']))
        constants['parent'].append((member(response_name.removeprefix('Parent').removesuffix('Response')[:1].lower()+response_name.removeprefix('Parent').removesuffix('Response')[1:]),response_name,info['id']))
        filename='supplemental-parent-'+info['path'].split('/')[-1]+'.json'
        public_fixture.write_text(json.dumps(scrub(data) if is_private else data,ensure_ascii=False,indent=2)+'\n')
        fixture_index.append({'file':filename,'responseType':response_name,'endpoint':info['id'],'supplemental':True})

for platform,items in constants.items():
    name=pascal(platform)+'Endpoints'
    source='import Foundation\n\npublic enum '+name+' {\n'
    for prop,response,id in items:
        evidence='用户抓包' if next(x for x in catalog if x['id']==id)['coveredByProvidedCaptures'] else '补充只读观察'
        source+='    /// '+evidence+'确认的端点契约；请求与副作用详情可通过 descriptor 查看。\n    public static let '+prop+' = CapturedEndpoint<'+response+'>(id: '+json.dumps(id)+')\n'
    source+='}\n'
    write_generated(platform,name+'.swift',source)

(ROOT/'Sources/IntCopilotCore/Resources/EndpointCatalog.json').write_text(json.dumps(catalog,ensure_ascii=False,indent=2)+'\n')
(ROOT/'Docs/FieldCatalog.json').write_text(json.dumps(field_catalog,ensure_ascii=False,indent=2)+'\n')
(ROOT/'Docs/CaptureCoverage.json').write_text(json.dumps([{'endpoint':p+':'+m+':'+path,'captures':[r['number'] for r in rs]} for (p,m,path),rs in sorted(captures.items())],ensure_ascii=False,indent=2)+'\n')
requests=[]
for (platform,method,path),records in sorted(captures.items()):
    for r in records:
        bindings={}
        for template,actual in zip(path.split('/'),r['actualPath'].split('/')):
            if template.startswith('{'):bindings[template[1:-1]]=scrub(actual,template[1:-1])
        requests.append({'capture':r['number'],'endpoint':platform+':'+method+':'+path,'query':{k:[scrub(v,k) for v in values] for k,values in r['query'].items() if k!='t'},'body':scrub(r['request']),'path':bindings})
(ROOT/'Tests/IntCopilotCoreTests/Fixtures/RequestFixtures.json').write_text(json.dumps(requests,ensure_ascii=False,indent=2)+'\n')

(ROOT/'Tests/IntCopilotCoreTests/Fixtures/FixtureIndex.json').write_text(json.dumps(fixture_index,ensure_ascii=False,indent=2)+'\n')
checks='import Foundation\nimport Testing\n@testable import IntCopilotCore\n\n@Test func allCapturedResponseFixturesDecode() throws {\n'
for item in fixture_index:
    checks+='    _ = try decodeFixture('+json.dumps(item['file'])+', as: '+item['responseType']+'.self)\n'
checks+='}\n'
(ROOT/'Tests/IntCopilotCoreTests/GeneratedCaptureTests.swift').write_text(checks)
print(json.dumps({'captures':sum(len(v) for v in captures.values()),'capturedEndpoints':len(captures),'catalogEndpoints':len(catalog),'models':len(field_catalog),'fixtures':len(fixture_index)},ensure_ascii=False))
