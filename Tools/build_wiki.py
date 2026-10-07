import hashlib
import json
import re
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
WIKI = ROOT / 'Wiki'
CATALOG = json.loads((ROOT / 'Sources/IntCopilotCore/Resources/EndpointCatalog.json').read_text())
FIELDS = json.loads((ROOT / 'Docs/FieldCatalog.json').read_text())
FIXTURES = json.loads((ROOT / 'Tests/IntCopilotCoreTests/Fixtures/FixtureIndex.json').read_text())
COVERAGE = json.loads((ROOT / 'Docs/CaptureCoverage.json').read_text())
RESPONSE_TYPES = {item['endpoint']: item['responseType'] for item in FIXTURES}
SOURCES = {
    'schoolId': ['/api/login/schools'], 'schoolYearId': ['/api/semester/currentSchoolYear', '/api/dropDown/schoolYearRuleList'],
    'studentId': ['/api/student/list', '/api/course/students'], 'courseId': ['/api/course/cascadeBySchoolYear', '/api/dropDown/relatedAllCourses'],
    'taskId': ['/api/task/mergeList', '/api/task/detail'], 'taskStudentId': ['/api/task/performance', '/api/task/mergeList'],
    'gradePeriodId': ['/api/monthly-grade/monthlyGradeByStudent', '/api/monthly-grade/grade-period/{courseId}'],
    'classArrangeId': ['/api/attendance/class', '/api/attendance/class/cca'], 'classPeriodId': ['/api/course/cascade/attendance'],
    'primaryTypeId': ['/api/diary/primary-type'], 'diaryEntryTypeId': ['/api/diary/entry-type'], 'diaryEntryId': ['/api/diary/by-student', '/api/diary/entries'],
    'reasonId': ['/api/dropDown/leave-reasons'], 'leaveApplicationId': ['/api/attendance/leave-application'],
    'campusId': ['/api/dropDown/campusList'], 'sectionId': ['/api/dropDown/sectionCascade'], 'sectionIds': ['/api/dropDown/sectionCascade'],
    'classId': ['/api/dropDown/classListAll'], 'taskTypeId': ['/api/dropDown/taskTypeByCourse', '/api/dropDown/taskType'],
    'messageMasterId': ['/api/message/fromList'], 'parentId': ['/api/dropDown/message/receiver'], 'toParents': ['/api/dropDown/message/receiver'],
    'teacherId': ['/api/login/userInfo', '/api/dropDown/course-teacher'], 'teacherIds': ['/api/dropDown/authTeachersForMessage'],
    'resourceIds': ['/api/resource/uploadToken'], 'enclosures': ['/api/resource/uploadToken'], 'attachments': ['/api/resource/uploadToken']
}
DOMAIN_ZH = {'attendance':'考勤与请假','task':'作业与成绩簿','monthly-grade':'成绩报告','student':'学生资料','curriculum':'课表','course':'课程','dropDown':'选项字典','diary':'行为日记','message':'消息','login':'认证','semester':'学期','grade-book':'成绩簿','calendar':'校历','resource':'资源','oauth':'门户 OAuth','api':'门户用户信息','render':'打印辅助'}

def group(endpoint):
    parts = endpoint['path'].removeprefix('/api/').split('/')
    return endpoint['platform'] + '-' + (parts[0] or 'root')

def anchor(endpoint):
    return 'endpoint-' + hashlib.sha256(endpoint['id'].encode()).hexdigest()[:12]

def link(endpoint):
    return 'API-' + group(endpoint) + '#' + anchor(endpoint)

def escape(value):
    return str(value).replace('|', '\\|').replace('\n', ' ')

def sources_for(endpoint, field):
    candidates = [e for path in SOURCES.get(field, []) for e in CATALOG if e['path'] == path and e['platform'] == endpoint['platform']]
    return ', '.join('[' + e['method'] + ' ' + e['path'] + '](' + link(e) + ')' for e in candidates) or endpoint['dependencies'].get(field, '由用户输入或同域上游记录提供；尚未确认的关联保持实验标记')

def semantic_purpose(endpoint):
    name = DOMAIN_ZH.get(endpoint['path'].removeprefix('/api/').split('/')[0], '前端业务')
    if not endpoint['coveredByProvidedCaptures'] and not endpoint['safetyConfirmed']:
        return '前端服务 `' + endpoint['name'] + '` 声明的' + name + '接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。'
    verbs = {'GET':'读取', 'POST':'提交', 'PUT':'修改', 'DELETE':'删除', 'PATCH':'修改'}
    overrides = {
        '/api/attendance/leave-application':'查询请假记录（GET）或提交申请（POST）；提交响应不保证包含新申请 ID。',
        '/api/attendance/leave-application/retrieve':'撤回用户选定的请假记录，使用列表返回的 leaveApplicationId。',
        '/api/task/student/detail':'读取所选 taskStudentId 对应的提交及成绩；返回后续评分所需 studentId/taskId。',
        '/api/task/updateScore':'写入单个学生任务的成绩、标签与评语。',
        '/api/course/cascade/attendance':'取得日期与课程类别对应的课程/课节级联，根 key 为 courseId，子 key 为 classPeriodId。',
        '/api/login/schools':'读取学校配置。家长返回公开入口配置，用域名匹配；教师用于可访问学校上下文。',
        '/api/login/unify':'家长密码或短信验证码认证；错误验证码必须保留 Cookie 与手机号上下文。',
        '/api/login/switchToken':'教师 SSO accessToken 交换为教师平台 Token。',
        '/api/dropDown/leave-reasons':'读取允许的具名请假原因，保留原始中英文名称。',
        '/api/diary/primary-type':'读取日记主类型、积分范围与特殊字段要求。',
        '/api/diary/entry-type':'读取所选 primaryTypeId 的日记子类型。',
        '/api/dropDown/message/receiver':'按前端查询模式读取消息收件人，家长记录须保留 parentId/studentId 关联。',
        '/api/attendance/attendance-status':'读取本学校与学年的具名考勤状态、可用性与统计配置。',
        '/api/semester/currentSchoolYear':'取得当前 schoolYearId 及学年名称、开始与结束毫秒时间。'
    }
    return overrides.get(endpoint['path'], verbs[endpoint['method']] + name + '数据；业务操作对应前端名称 `' + endpoint['name'] + '`，完整参数与结构见下表。')

pages = defaultdict(list)
for endpoint in CATALOG:
    pages[group(endpoint)].append(endpoint)

index = ['# 完整接口清单', '', '接口目录同时记录原始抓包、静态发现和补充只读验证。稳定性与副作用是独立维度；未完整验证的发现保留实验入口。', '', '| 业务域 | 端点数 | 抓包覆盖数 |', '|---|---:|---:|']
for key, endpoints in sorted(pages.items()):
    index.append(f'| [API-{key}](API-{key}) | {len(endpoints)} | {sum(e["coveredByProvidedCaptures"] for e in endpoints)} |')
    out = ['# ' + key + ' API 参考', '', '本文由公开端点目录生成。接口方法不决定安全性。字段含义不足时保持未确认说明，原始私人材料不随文档发布。', '']
    for endpoint in endpoints:
        out += ['<a id="' + anchor(endpoint) + '"></a>', '## ' + endpoint['method'] + ' `' + endpoint['path'] + '`', '', semantic_purpose(endpoint), '',
                '| 属性 | 内容 |', '|---|---|', '| 平台 / 前端名称 | ' + endpoint['platform'] + ' / ' + endpoint['name'] + ' |',
                '| 契约 | ' + endpoint['stability'] + ' |', '| 安全分类 | ' + endpoint['safety'] + ' |',
                '| 外部副作用 | ' + str(endpoint['hasExternalSideEffects']) + ' |', '| 安全性已确认 | ' + str(endpoint['safetyConfirmed']) + ' |',
                '| 原始抓包覆盖 | ' + str(endpoint['coveredByProvidedCaptures']) + ' |', '| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |', '']
        for warning in endpoint['warnings']: out += ['> ' + warning, '']
        out += ['### 参数与来源', '', '| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |', '|---|---|---|---|']
        for field in re.findall(r'\{([^}]+)\}', endpoint['path']): out.append('| path | `' + field + '` | 标识 | ' + escape(sources_for(endpoint, field)) + ' |')
        for field in endpoint['queryParameters']: out.append('| query | `' + field + '` | URL 参数 | ' + escape(sources_for(endpoint, field)) + ' |')
        for field in endpoint['bodyFields']: out.append('| body | `' + field + '` | ' + endpoint['bodyFieldTypes'].get(field, '未确认') + ' | ' + escape(sources_for(endpoint, field)) + ' |')
        if not endpoint['queryParameters'] and not endpoint['bodyFields'] and '{' not in endpoint['path']: out.append('| — | 未观察到具名参数 | — | 认证头和学校上下文由会话管理 |')
        out += ['', '字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。', '', '### 响应与调用', '']
        response = RESPONSE_TYPES.get(endpoint['id'])
        if response:
            out += ['响应类型：`' + response + '`。完整嵌套字段见 [字段参考](Fields-' + group(endpoint) + ')。新增字段进入 `additionalFields`，混合或未确定结构保留 `JSONValue`。', '']
        else:
            out += ['空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。', '']
        if endpoint['stability'] == 'stable' and endpoint['platform'] in {'parent','teacher'}:
            out += ['使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。', '']
        else:
            out += ['业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。', '']
        out += ['### 证据与验证范围', '']
        for evidence in endpoint['evidence']:
            ref = evidence['reference']
            out.append('- ' + evidence['kind'] + ': ' + ('[公开脚本](' + ref + ')' if ref.startswith('https://') else '`' + ref + '`'))
        out += ['', 'mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。', '']
        if endpoint['requestExpression']: out += ['```javascript', endpoint['requestExpression'], '```', '']
    (WIKI / ('API-' + key + '.md')).write_text('\n'.join(out) + '\n')
(WIKI / 'API-Index.md').write_text('\n'.join(index) + '\n')

field_pages = defaultdict(dict)
for endpoint in CATALOG:
    response = RESPONSE_TYPES.get(endpoint['id'])
    if not response: continue
    base = response.removesuffix('Response') + 'Response'
    for model, fields in FIELDS.items():
        if model.startswith(base): field_pages[group(endpoint)][model] = fields
for key, models in sorted(field_pages.items()):
    out = ['# ' + key + ' 字段参考', '', '字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。', '']
    for model, fields in sorted(models.items()):
        out += ['## `' + model + '`', '', '| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |', '|---|---|---|---|']
        for field in fields: out.append('| `' + field['field'] + '` | `' + field['type'] + '` | ' + escape(field['meaning']) + ' | ' + (field['semanticDomain'] or '—') + ' |')
        out += ['', '| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |', '| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |', '']
    (WIKI / ('Fields-' + key + '.md')).write_text('\n'.join(out) + '\n')

out = ['# 原始抓包覆盖记录', '', '以下编号只引用本地抓包，不包含原始文件、账号、Token、Cookie 或真人数据。认证的空/非 JSON 重定向通过专用流程 mock 验证。', '', '| 请求端点 | 原始抓包编号 |', '|---|---|']
for item in COVERAGE:
    endpoint = next(e for e in CATALOG if e['id'] == item['endpoint'])
    out.append('| [' + escape(item['endpoint']) + '](' + link(endpoint) + ') | ' + ', '.join(item['captures']) + ' |')
(WIKI / 'Capture-Coverage.md').write_text('\n'.join(out) + '\n')

examples = (ROOT / 'Tests/IntCopilotCoreTests/SOPExamples.swift').read_text()
(WIKI / 'SOP-Examples.md').write_text('# 可编译 SOP 示例\n\n以下函数与测试 target 的源码一致，账号、学生、周期和选项由 App 用户选择后传入。它们不会被 CI 连接到真实平台。写入单独执行，没有隐式提交。\n\n```swift\n' + examples + '\n```\n')

home = ['# IntCopilot.Core', '', 'Swift 6 API 库，公开模块 `IntCopilotCore`，运行时仅依赖 Foundation。MIT 许可。家长与教师客户端独立管理内存会话。', '',
        f'当前目录记录 **{len(CATALOG)} 个端点**；**{len(COVERAGE)} 个端点覆盖全部 157 组原始请求/响应**，另有补充只读证据。响应模型保留所有已确认字段、动态字典与新增字段。原始研究资料不公开。', '',
        '| 文档 | 内容 |', '|---|---|']
sections = {'Installation':'安装与平台','Authentication':'认证、短信重试与 Token 恢复','Architecture':'架构与模块边界','API-Index':'逐接口参考','Capture-Coverage':'157 组抓包覆盖','Dependencies':'参数依赖图与来源','Semantics':'业务语义字典','Risks':'不稳定性、外部副作用及证据','SOP':'标准操作调用顺序','SOP-Examples':'可编译 Swift 示例','Testing':'脱敏测试与真实测试边界','Adding-APIs':'新增 API 完整指南'}
for page, title in sections.items(): home.append('| [' + title + '](' + page + ') | ' + title + ' |')
home += ['', '[仓库与 CI](https://github.com/RyanStanLin/IntCopilot.Core) · [验证报告](https://github.com/RyanStanLin/IntCopilot.Core/blob/main/Docs/ValidationReport.json)', '', 'Wiki 源文件随主仓库版本管理，并同步 GitHub 原生 Wiki。静态发现和 mock 不代表真实契约验证；未完整确认接口留在实验入口。']
(WIKI / 'Home.md').write_text('\n'.join(home) + '\n')
(WIKI / '_Sidebar.md').write_text('\n'.join('- [' + title + '](' + page + ')' for page, title in [('Home','首页')] + list(sections.items())) + '\n')
print(json.dumps({'wikiPages': len(list(WIKI.glob('*.md'))), 'endpoints': len(CATALOG), 'fieldModels': len(FIELDS)}))
