import SwiftUI
import IntCopilotCore

struct StudentView: View {
    @EnvironmentObject private var store: DemoStore
    var body: some View {
        LabCard("学生信息", symbol: "person.text.rectangle") {
            Text("从上方获取并选择学生。查询结果包含嵌套资料、完整字段与新增字段。").foregroundStyle(.secondary)
            actions
        }
    }
    @ViewBuilder private var actions: some View {
        ActionButton("完整资料") { await store.loadStudent(.details) }
        ActionButton("班级与学院") { await store.loadStudent(.classes) }
        if store.platform == .parent {
            ActionButton("关联家长") { await store.loadStudent(.parents) }
            ActionButton("课程选课记录") { await store.loadStudent(.courseRecords) }
        }
    }
}
struct CourseView: View {
    @EnvironmentObject private var store: DemoStore
    var body: some View {
        LabCard("课程与学生名单", symbol: "books.vertical") {
            Text("先获取课程，选择课程后再查询名单；学生引用保留所属学校。其他学校的旧引用会被 SDK 拒绝。").foregroundStyle(.secondary)
            Picker("课程类别", selection: $store.courseKind) { Text("常规课程").tag(CourseKind.regular); Text("延展课程 CCA").tag(CourseKind.cca) }
            RangeControls()
            ActionButton("课程列表") { await store.loadCourses() }
            ActionButton("课程学生名单") { await store.loadStudents() }
            ActionButton("课程任务类型") { await store.loadOptions(.taskTypes) }
        }
    }
}
struct TimetableView: View {
    @EnvironmentObject private var store: DemoStore
    var body: some View {
        LabCard("查询时间范围", symbol: "calendar") {
            RangeControls()
            ActionButton("学生课表") { await store.loadStudent(.timetable) }
            if store.platform == .parent { ActionButton("月份校历") { await store.loadStudent(.calendar) } }
            else { ActionButton("教师个人课表") { await store.loadPersonalTimetable() } }
        }
    }
}
struct AttendanceView: View {
    @EnvironmentObject private var store: DemoStore
    var body: some View {
        LabCard("学生考勤", symbol: "checkmark.circle") {
            RangeControls()
            ActionButton("学生考勤统计") { await store.loadStudent(.attendance) }
        }
        if store.platform == .teacher {
            LabCard("课程课节考勤", symbol: "person.3.sequence") {
                Picker("类别", selection: $store.courseKind) { Text("常规课程").tag(CourseKind.regular); Text("延展课程 CCA").tag(CourseKind.cca) }
                ActionButton("获取当天课节") { await store.loadPeriods() }
                OptionPicker(title: "课节", options: store.optionsForPeriod, selection: $store.selectedPeriodID)
                ActionButton("查询课节考勤") { await store.loadClassAttendance() }
                ActionButton("获取可用考勤状态") { await store.loadAttendanceStatuses() }
                Text("登记操作位于手动写入测试区；这里的查询不写入平台。").font(.caption).foregroundStyle(.secondary)
            }
        }
    }
}
struct AssignmentView: View {
    @EnvironmentObject private var store: DemoStore
    var body: some View {
        LabCard("作业 → 详情 → 学生记录", symbol: "list.clipboard") {
            RangeControls()
            ActionButton("获取作业列表") { await store.loadTasks() }
            Picker("作业", selection: $store.selectedTaskID) {
                Text("选择作业").tag("")
                if store.platform == .parent {
                    ForEach(store.parentTasks.filter {$0.type.code == "1001"}, id: \.entityId) { Text($0.name).tag(String($0.entityId)) }
                } else {
                    ForEach(store.teacherTasks.filter {$0.type.code == "1001"}, id: \.entityId) { Text($0.name).tag(String($0.entityId)) }
                }
            }
            ActionButton("作业详情") { await store.loadTaskDetails() }
            ActionButton(store.platform == .parent ? "成绩簿（原抓包接口）" : "成绩簿") { await store.loadStudent(.gradeBook) }
            if store.platform == .parent { Text("2026-10-08 只读实测：原成绩簿路由返回 404。保留查询以观察平台恢复；新增的 V2 路由安全性未确认，需由你在接口目录中手动测试。").font(.caption).foregroundStyle(.orange) }
            if store.platform == .teacher {
                ActionButton("获取作业学生记录") { await store.loadSubmissions() }
                Picker("学生记录", selection: $store.selectedSubmissionID) {
                    Text("选择学生记录").tag("")
                    ForEach(store.submissions, id: \.taskStudentId) { Text($0.studentName).tag(String($0.taskStudentId)) }
                }
                ActionButton("学生作业成绩详情") { await store.loadSubmissionDetails() }
            }
        }
    }
}
struct ReportsView: View {
    @EnvironmentObject private var store: DemoStore
    var body: some View {
        LabCard("报告周期与详情", symbol: "chart.bar.doc.horizontal") {
            ActionButton("获取报告周期") { await store.loadReports() }
            Picker("报告周期", selection: $store.selectedReportID) {
                Text("选择周期").tag("")
                if store.platform == .parent { ForEach(store.parentReports, id: \.gradePeriodId) { Text($0.name + " · " + $0.schoolYear).tag(String($0.gradePeriodId)) } }
                else { ForEach(store.teacherReports) { Text($0.name).tag($0.id) } }
            }
            ActionButton(store.platform == .parent ? "报告详情" : "周期成绩表") { await store.loadReportDetails() }
            Text("下载/打印的跨域契约仍有实验限制。这里不把 Token 交给外部地址，也不自动生成或发送报告。").font(.caption).foregroundStyle(.secondary)
        }
    }
}
struct DiaryView: View {
    @EnvironmentObject private var store: DemoStore
    @State private var primaryID = ""
    var body: some View {
        LabCard("行为记录", symbol: "book.closed") {
            RangeControls()
            ActionButton("所选学生日记") { await store.loadStudent(.diary) }
            if store.platform == .teacher {
                ActionButton("日记主类型") { await store.loadOptions(.diaryTypes) }
                OptionPicker(title: "主类型", options: store.optionSets["diaryPrimaryType"] ?? [], selection: $primaryID)
                ActionButton("对应子类型") { await store.loadOptions(.diarySubtypes, selected: store.optionSets["diaryPrimaryType"]?.first {$0.id == primaryID}) }
                Text("字典带名称和积分范围。创建行为记录由你在手动测试区执行。").font(.caption).foregroundStyle(.secondary)
            }
        }
    }
}
struct LeaveView: View {
    @EnvironmentObject private var store: DemoStore
    var body: some View {
        LabCard("请假审批记录", symbol: "calendar.badge.clock") {
            if store.platform == .parent {
                RangeControls()
                ActionButton("请假类型与原因") { await store.loadLeaveOptions() }
                ActionButton("查询申请与审批状态") { await store.loadLeaves() }
                Text("提交和撤回都在手动写入区。空提交响应不会被当作申请 ID。").font(.caption).foregroundStyle(.secondary)
            } else { Text("教师请假查询及实验功能可从完整 API 目录选择；业务写入需你逐次确认。") }
        }
    }
}
struct OptionsView: View {
    @EnvironmentObject private var store: DemoStore
    @State private var campusID = ""
    var body: some View {
        LabCard("具名业务字典", symbol: "slider.horizontal.3") {
            ForEach(OptionQuery.allCases.filter { store.platform == .parent ? $0 == .schoolYears : ![.effort,.attainment,.diarySubtypes,.taskTypes].contains($0) }, id: \.rawValue) { item in
                ActionButton(item.rawValue) { await store.loadOptions(item) }
            }
            if store.platform == .teacher {
                OptionPicker(title: "学部", options: store.optionSets["campus"] ?? [], selection: $campusID)
                ActionButton("学部努力等级") { await store.loadOptions(.effort, selected: store.optionSets["campus"]?.first {$0.id == campusID}) }
                ActionButton("学部达成等级") { await store.loadOptions(.attainment, selected: store.optionSets["campus"]?.first {$0.id == campusID}) }
            }
        }
    }
}
struct TraceView: View {
    @EnvironmentObject private var store: DemoStore
    var body: some View {
        LabCard("最近请求", symbol: "clock.arrow.circlepath") {
            HStack {
                ActionButton("刷新") { await store.refreshTrace() }
                ActionButton("清空记录", symbol: "trash") { await store.currentTransport.clearHistory(); await store.refreshTrace() }
            }
            Text("不显示请求参数、认证头、Cookie、Token 或响应正文。数值路径标识也已遮蔽。").font(.caption).foregroundStyle(.secondary)
            ForEach(store.traces) { trace in
                VStack(alignment: .leading, spacing: 3) {
                    Text(trace.method+" "+trace.path).font(.caption.monospaced())
                    Text("\(trace.status.map(String.init) ?? "—") · \(Int(trace.elapsed*1000)) ms · \(trace.bytes) bytes · \(trace.outcome)").font(.caption).foregroundStyle(.secondary)
                }.padding(.vertical, 4)
            }
        }
    }
}
