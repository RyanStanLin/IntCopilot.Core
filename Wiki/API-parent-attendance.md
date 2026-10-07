# parent-attendance API 参考

本文由公开端点目录生成。接口方法不决定安全性。字段含义不足时保持未确认说明，原始私人材料不随文档发布。

<a id="endpoint-c2929f80255b"></a>
## GET `/api/attendance/attendance-status`

读取本学校与学年的具名考勤状态、可用性与统计配置。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / getAttendanceKinds |
| 契约 | stable |
| 安全分类 | readOnly |
| 外部副作用 | False |
| 安全性已确认 | True |
| 原始抓包覆盖 | True |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| — | 未观察到具名参数 | — | 认证头和学校上下文由会话管理 |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

响应类型：`ParentAttendanceAttendanceStatusGETResponse`。完整嵌套字段见 [字段参考](Fields-parent-attendance)。新增字段进入 `additionalFields`，混合或未确定结构保留 `JSONValue`。

使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。

### 证据与验证范围

- providedCapture: `capture:362`
- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/attendance/attendance-status",e)
```

<a id="endpoint-d79e7d4199da"></a>
## GET `/api/attendance/leave-application`

查询请假记录（GET）或提交申请（POST）；提交响应不保证包含新申请 ID。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / getApplicationList |
| 契约 | stable |
| 安全分类 | readOnly |
| 外部副作用 | False |
| 安全性已确认 | True |
| 原始抓包覆盖 | True |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `pageCurrent` | URL 参数 | 页码，从 1 开始 |
| query | `pageSize` | URL 参数 | 分页大小，以记录条数为单位 |
| query | `studentId` | URL 参数 | [GET /api/student/list](API-parent-student#endpoint-ddd046aba236) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

响应类型：`ParentAttendanceLeaveApplicationGETResponse`。完整嵌套字段见 [字段参考](Fields-parent-attendance)。新增字段进入 `additionalFields`，混合或未确定结构保留 `JSONValue`。

使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。

### 证据与验证范围

- providedCapture: `capture:395`
- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/attendance/leave-application",Object(n["a"])({params:{pageCurrent:e,pageSize:t,studentId:a,startTime:o,endTime:s}},r))
```

<a id="endpoint-4a5aa188b593"></a>
## GET `/api/attendance/statistic/student/{schoolYearId}`

读取考勤与请假数据；业务操作对应前端名称 `getStudentStatistics`，完整参数与结构见下表。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / getStudentStatistics |
| 契约 | stable |
| 安全分类 | readOnly |
| 外部副作用 | False |
| 安全性已确认 | True |
| 原始抓包覆盖 | True |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| path | `schoolYearId` | 标识 | [GET /api/semester/currentSchoolYear](API-parent-semester#endpoint-d8164f3d282d), [GET /api/dropDown/schoolYearRuleList](API-parent-dropDown#endpoint-c0a6f8edfb12) |
| query | `end` | URL 参数 | 区间结束值；日期查询使用 Unix 毫秒 |
| query | `start` | URL 参数 | 区间开始值；日期查询使用 Unix 毫秒 |
| query | `studentId` | URL 参数 | [GET /api/student/list](API-parent-student#endpoint-ddd046aba236) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

响应类型：`ParentAttendanceStatisticStudentSchoolYearIdGETResponse`。完整嵌套字段见 [字段参考](Fields-parent-attendance)。新增字段进入 `additionalFields`，混合或未确定结构保留 `JSONValue`。

使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。

### 证据与验证范围

- providedCapture: `capture:363`
- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/attendance/statistic/student/".concat(e),Object(n["a"])({params:{studentId:t,start:a,end:o}},s))
```

<a id="endpoint-f31876918672"></a>
## POST `/api/attendance/leave-application`

查询请假记录（GET）或提交申请（POST）；提交响应不保证包含新申请 ID。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / saveLeaveApplication |
| 契约 | stable |
| 安全分类 | externalEffect |
| 外部副作用 | True |
| 安全性已确认 | True |
| 原始抓包覆盖 | True |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| body | `endTime` | int | 结束时刻，Unix 毫秒或端点定义的课节时间 |
| body | `reason` | string | 请假原因说明或课程离班说明 |
| body | `reasonId` | int | [GET /api/dropDown/leave-reasons](API-parent-dropDown#endpoint-19f433bf9009) |
| body | `resourceIds` | array | 已上传资源标识 |
| body | `startTime` | int | 开始时刻，Unix 毫秒或端点定义的课节时间 |
| body | `studentId` | string | [GET /api/student/list](API-parent-student#endpoint-ddd046aba236) |
| body | `type` | string | 本业务域类型；不能跨业务域套用代码表 |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。

### 证据与验证范围

- providedCapture: `capture:410`
- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.post("/attendance/leave-application",e,t)
```

<a id="endpoint-059a22fa2577"></a>
## PUT `/api/attendance/leave-application/retrieve`

撤回用户选定的请假记录，使用列表返回的 leaveApplicationId。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / retrieveApplication |
| 契约 | stable |
| 安全分类 | externalEffect |
| 外部副作用 | True |
| 安全性已确认 | True |
| 原始抓包覆盖 | True |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `leaveApplicationId` | URL 参数 | [GET /api/attendance/leave-application](API-parent-attendance#endpoint-d79e7d4199da), [POST /api/attendance/leave-application](API-parent-attendance#endpoint-f31876918672) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。

### 证据与验证范围

- providedCapture: `capture:421`
- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.put("/attendance/leave-application/retrieve",{},Object(n["a"])({params:{leaveApplicationId:e}},t))
```

<a id="endpoint-d5f0ab603b48"></a>
## GET `/api/attendance/attendance-type`

前端服务 `getAttendanceType` 声明的考勤与请假接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / getAttendanceType |
| 契约 | unstable |
| 安全分类 | unverified |
| 外部副作用 | None |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 安全性未确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `studentId` | URL 参数 | [GET /api/student/list](API-parent-student#endpoint-ddd046aba236) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/attendance/attendance-type",Object(n["a"])({params:{studentId:e}},t))
```

<a id="endpoint-ad8c7bf04bb8"></a>
## GET `/api/attendance/kg/student`

前端服务 `getKGStudentAttendance` 声明的考勤与请假接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / getKGStudentAttendance |
| 契约 | unstable |
| 安全分类 | unverified |
| 外部副作用 | None |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 安全性未确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `date` | URL 参数 | 业务日期，日期型端点使用 Unix 毫秒 |
| query | `schoolYearId` | URL 参数 | [GET /api/semester/currentSchoolYear](API-parent-semester#endpoint-d8164f3d282d), [GET /api/dropDown/schoolYearRuleList](API-parent-dropDown#endpoint-c0a6f8edfb12) |
| query | `studentId` | URL 参数 | [GET /api/student/list](API-parent-student#endpoint-ddd046aba236) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/attendance/kg/student",Object(n["a"])({params:{schoolYearId:e,studentId:t,date:a}},o))
```

<a id="endpoint-8647ffd3bbc7"></a>
## GET `/api/attendance/kg/student-week`

前端服务 `getKGStudentAttendanceOfWeek` 声明的考勤与请假接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / getKGStudentAttendanceOfWeek |
| 契约 | unstable |
| 安全分类 | unverified |
| 外部副作用 | None |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 安全性未确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `endDate` | URL 参数 | 结束日期或截止时刻，Unix 毫秒 |
| query | `schoolYearId` | URL 参数 | [GET /api/semester/currentSchoolYear](API-parent-semester#endpoint-d8164f3d282d), [GET /api/dropDown/schoolYearRuleList](API-parent-dropDown#endpoint-c0a6f8edfb12) |
| query | `startDate` | URL 参数 | 开始日期或时刻，Unix 毫秒 |
| query | `studentId` | URL 参数 | [GET /api/student/list](API-parent-student#endpoint-ddd046aba236) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/attendance/kg/student-week",Object(n["a"])({params:{schoolYearId:e,studentId:t,startDate:a,endDate:o}},s))
```

<a id="endpoint-227235396bf0"></a>
## GET `/api/attendance/leave-application/auditor`

前端服务 `getAuditors` 声明的考勤与请假接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / getAuditors |
| 契约 | unstable |
| 安全分类 | unverified |
| 外部副作用 | None |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 安全性未确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `studentId` | URL 参数 | [GET /api/student/list](API-parent-student#endpoint-ddd046aba236) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/attendance/leave-application/auditor",Object(n["a"])({params:{studentId:e}},t))
```

<a id="endpoint-4429e8662bb5"></a>
## GET `/api/attendance/leave-application/detail`

前端服务 `getLeaveApplication` 声明的考勤与请假接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / getLeaveApplication |
| 契约 | unstable |
| 安全分类 | unverified |
| 外部副作用 | None |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 安全性未确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `leaveApplicationId` | URL 参数 | [GET /api/attendance/leave-application](API-parent-attendance#endpoint-d79e7d4199da), [POST /api/attendance/leave-application](API-parent-attendance#endpoint-f31876918672) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/attendance/leave-application/detail",Object(n["a"])({params:{leaveApplicationId:e}},t))
```

<a id="endpoint-9054da3d734c"></a>
## GET `/api/attendance/statistic/course/student`

前端服务 `getStudentCourseStatistics` 声明的考勤与请假接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / getStudentCourseStatistics |
| 契约 | unstable |
| 安全分类 | unverified |
| 外部副作用 | None |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 安全性未确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `end` | URL 参数 | 区间结束值；日期查询使用 Unix 毫秒 |
| query | `start` | URL 参数 | 区间开始值；日期查询使用 Unix 毫秒 |
| query | `studentId` | URL 参数 | [GET /api/student/list](API-parent-student#endpoint-ddd046aba236) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/attendance/statistic/course/student",Object(n["a"])({params:{start:e,end:t,studentId:a}},o))
```

<a id="endpoint-980dbf5e2fd6"></a>
## GET `/api/attendance/statistic/student/ele/{pathSuffix}`

前端服务 `getEleStudentStatistics` 声明的考勤与请假接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / getEleStudentStatistics |
| 契约 | unstable |
| 安全分类 | unverified |
| 外部副作用 | None |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 安全性未确认，禁止用于自动真实测试。

> 动态路径参数来自前端表达式；pathSuffix 的完整语义仍需确认。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| path | `pathSuffix` | 标识 | 由用户输入或同域上游记录提供；尚未确认的关联保持实验标记 |
| query | `end` | URL 参数 | 区间结束值；日期查询使用 Unix 毫秒 |
| query | `start` | URL 参数 | 区间开始值；日期查询使用 Unix 毫秒 |
| query | `studentId` | URL 参数 | [GET /api/student/list](API-parent-student#endpoint-ddd046aba236) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/attendance/statistic/student/ele/".concat(e),Object(n["a"])({params:{start:t,end:a,studentId:o}},s))
```

<a id="endpoint-63c91af70e25"></a>
## GET `/api/attendance/student/absent`

前端服务 `studentAbsent` 声明的考勤与请假接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / studentAbsent |
| 契约 | unstable |
| 安全分类 | unverified |
| 外部副作用 | None |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 安全性未确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `schoolId` | URL 参数 | [GET /api/login/schools](API-parent-login#endpoint-86f83b11214e) |
| query | `type` | URL 参数 | 本业务域类型；不能跨业务域套用代码表 |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/attendance/student/absent",Object(n["a"])({params:{schoolId:e,type:t}},a))
```

<a id="endpoint-e9968ad08b9a"></a>
## GET `/api/attendance/student/daily`

前端服务 `getDailyStudentAttendanceInfo` 声明的考勤与请假接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / getDailyStudentAttendanceInfo |
| 契约 | unstable |
| 安全分类 | unverified |
| 外部副作用 | None |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 安全性未确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `date` | URL 参数 | 业务日期，日期型端点使用 Unix 毫秒 |
| query | `studentId` | URL 参数 | [GET /api/student/list](API-parent-student#endpoint-ddd046aba236) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/attendance/student/daily",Object(n["a"])({params:{date:e,studentId:t}},a))
```

<a id="endpoint-40cf33a4c549"></a>
## POST `/api/attendance/leave-application/time-check`

前端服务 `isValid` 声明的考勤与请假接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / isValid |
| 契约 | unstable |
| 安全分类 | unverified |
| 外部副作用 | None |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 安全性未确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| — | 未观察到具名参数 | — | 认证头和学校上下文由会话管理 |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.post("/attendance/leave-application/time-check",e,t)
```

