# teacher-diary API 参考

本文由公开端点目录生成。接口方法不决定安全性。字段含义不足时保持未确认说明，原始私人材料不随文档发布。

<a id="endpoint-93730817ab98"></a>
## DELETE `/api/diary`

删除行为日记数据；业务操作对应前端名称 `Diary`，完整参数与结构见下表。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / Diary |
| 契约 | stable |
| 安全分类 | externalEffect |
| 外部副作用 | True |
| 安全性已确认 | True |
| 原始抓包覆盖 | True |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `diaryEntryId` | URL 参数 | [GET /api/diary/by-student](API-teacher-diary#endpoint-053a65577f3d), [GET /api/diary/entries](API-teacher-diary#endpoint-d2dc605f0dd7) |
| query | `studentId` | URL 参数 | [GET /api/student/list](API-teacher-student#endpoint-c3f0d826a40e), [GET /api/course/students](API-teacher-course#endpoint-a84d7d961c28) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。

### 证据与验证范围

- providedCapture: `capture:2537`

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

<a id="endpoint-053a65577f3d"></a>
## GET `/api/diary/by-student`

读取行为日记数据；业务操作对应前端名称 `getDiaryEntrySummary`，完整参数与结构见下表。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getDiaryEntrySummary |
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
| query | `studentId` | URL 参数 | [GET /api/student/list](API-teacher-student#endpoint-c3f0d826a40e), [GET /api/course/students](API-teacher-course#endpoint-a84d7d961c28) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

响应类型：`TeacherDiaryByStudentGETResponse`。完整嵌套字段见 [字段参考](Fields-teacher-diary)。新增字段进入 `additionalFields`，混合或未确定结构保留 `JSONValue`。

使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。

### 证据与验证范围

- providedCapture: `capture:2436`
- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/diary/by-student",Object(n.a)({params:e},t))
```

<a id="endpoint-d2dc605f0dd7"></a>
## GET `/api/diary/entries`

读取行为日记数据；业务操作对应前端名称 `getStudentDiaryEntries`，完整参数与结构见下表。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getStudentDiaryEntries |
| 契约 | stable |
| 安全分类 | readOnly |
| 外部副作用 | False |
| 安全性已确认 | True |
| 原始抓包覆盖 | True |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `name` | URL 参数 | 业务实体或选项名称 |
| query | `pageCurrent` | URL 参数 | 页码，从 1 开始 |
| query | `pageSize` | URL 参数 | 分页大小，以记录条数为单位 |
| query | `primaryTypeId` | URL 参数 | [GET /api/diary/primary-type](API-teacher-diary#endpoint-f72f75be97e8) |
| query | `schoolYearId` | URL 参数 | [GET /api/semester/currentSchoolYear](API-teacher-semester#endpoint-ff61d57df37c), [GET /api/dropDown/schoolYearRuleList](API-teacher-dropDown#endpoint-73c464f44d8c) |
| query | `sectionId` | URL 参数 | [GET /api/dropDown/sectionCascade](API-teacher-dropDown#endpoint-1771098af5a4) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

响应类型：`TeacherDiaryEntriesGETResponse`。完整嵌套字段见 [字段参考](Fields-teacher-diary)。新增字段进入 `additionalFields`，混合或未确定结构保留 `JSONValue`。

使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。

### 证据与验证范围

- providedCapture: `capture:1513`
- providedCapture: `capture:1525`
- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/diary/entries",Object(n.a)({params:e},t))
```

<a id="endpoint-042ffc697d0f"></a>
## GET `/api/diary/entry-type`

读取所选 primaryTypeId 的日记子类型。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getDiaryEntryTypes |
| 契约 | stable |
| 安全分类 | readOnly |
| 外部副作用 | False |
| 安全性已确认 | True |
| 原始抓包覆盖 | True |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `primaryTypeId` | URL 参数 | [GET /api/diary/primary-type](API-teacher-diary#endpoint-f72f75be97e8) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

响应类型：`TeacherDiaryEntryTypeGETResponse`。完整嵌套字段见 [字段参考](Fields-teacher-diary)。新增字段进入 `additionalFields`，混合或未确定结构保留 `JSONValue`。

使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。

### 证据与验证范围

- providedCapture: `capture:2833`
- providedCapture: `capture:2834`
- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/diary/entry-type",Object(n.a)({params:{primaryTypeId:e,allType:t}},a))
```

<a id="endpoint-f72f75be97e8"></a>
## GET `/api/diary/primary-type`

读取日记主类型、积分范围与特殊字段要求。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getPrimaryTypes |
| 契约 | stable |
| 安全分类 | readOnly |
| 外部副作用 | False |
| 安全性已确认 | True |
| 原始抓包覆盖 | True |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `allType` | URL 参数 | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

响应类型：`TeacherDiaryPrimaryTypeGETResponse`。完整嵌套字段见 [字段参考](Fields-teacher-diary)。新增字段进入 `additionalFields`，混合或未确定结构保留 `JSONValue`。

使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。

### 证据与验证范围

- providedCapture: `capture:2814`
- providedCapture: `capture:1507`
- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/diary/primary-type",Object(n.a)({params:{containsHidden:e,allType:t}},a))
```

<a id="endpoint-38975134268e"></a>
## POST `/api/diary`

提交行为日记数据；业务操作对应前端名称 `Diary`，完整参数与结构见下表。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / Diary |
| 契约 | stable |
| 安全分类 | externalEffect |
| 外部副作用 | True |
| 安全性已确认 | True |
| 原始抓包覆盖 | True |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| body | `addressee` | array | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |
| body | `attachments` | array | 附件输入或附件元数据 |
| body | `confidential` | bool | 是否保密记录 |
| body | `date` | string | 业务日期，日期型端点使用 Unix 毫秒 |
| body | `description` | string | 业务说明或富文本内容 |
| body | `diaryEntryTypeId` | int | [GET /api/diary/entry-type](API-teacher-diary#endpoint-042ffc697d0f) |
| body | `enclosures` | array | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |
| body | `followUpAction` | string | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |
| body | `followUpAdvice` | string | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |
| body | `followUpDate` | int | 后续跟进日期，Unix 毫秒 |
| body | `injureParts` | array | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |
| body | `location` | string | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |
| body | `notice` | bool | 是否启用服务端通知标记 |
| body | `points` | int | 本次行为积分 |
| body | `primaryTypeId` | int | [GET /api/diary/primary-type](API-teacher-diary#endpoint-f72f75be97e8) |
| body | `recordTime` | int | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |
| body | `shareWithHeadTeachers` | bool | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |
| body | `shareWithParents` | bool | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |
| body | `shareWithStudents` | bool | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |
| body | `shareWithTutors` | bool | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |
| body | `students` | array | 关联学生列表 |
| body | `time` | string | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。

### 证据与验证范围

- providedCapture: `capture:2471`

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

<a id="endpoint-a6c545bae28f"></a>
## DELETE `/api/diary/`

前端服务 `deleteDiary` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / deleteDiary |
| 契约 | unstable |
| 安全分类 | externalEffect |
| 外部副作用 | True |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 具有外部副作用；真实测试须逐项获得许可。

> 安全性未完整确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `diaryEntryId` | URL 参数 | [GET /api/diary/by-student](API-teacher-diary#endpoint-053a65577f3d), [GET /api/diary/entries](API-teacher-diary#endpoint-d2dc605f0dd7) |
| query | `studentId` | URL 参数 | [GET /api/student/list](API-teacher-student#endpoint-c3f0d826a40e), [GET /api/course/students](API-teacher-course#endpoint-a84d7d961c28) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.delete("/diary/",Object(n.a)({params:{diaryEntryId:e,studentId:t}},a))
```

<a id="endpoint-55c1f35be957"></a>
## GET `/api/diary/`

前端服务 `getDiaryEntry` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getDiaryEntry |
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
| query | `diaryEntryId` | URL 参数 | [GET /api/diary/by-student](API-teacher-diary#endpoint-053a65577f3d), [GET /api/diary/entries](API-teacher-diary#endpoint-d2dc605f0dd7) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/diary/",Object(n.a)({params:{diaryEntryId:e}},t))
```

<a id="endpoint-20c4ac8f3dbe"></a>
## GET `/api/diary/diaryListByTeacherId`

前端服务 `getDiaryEntryList` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getDiaryEntryList |
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

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/diary/diaryListByTeacherId",e)
```

<a id="endpoint-13b4e9babc6a"></a>
## GET `/api/diary/export`

前端服务 `getDiaryExport` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getDiaryExport |
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

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/diary/export",Object(n.a)({params:e},t))
```

<a id="endpoint-392c9ca61e59"></a>
## GET `/api/diary/follow-notice`

前端服务 `followNotice` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / followNotice |
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
| query | `now` | URL 参数 | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |
| query | `schoolId` | URL 参数 | [GET /api/login/schools](API-teacher-login#endpoint-ad501f465b20) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/diary/follow-notice",Object(n.a)({params:{schoolId:e,now:t}},a))
```

<a id="endpoint-e5a7a7078979"></a>
## GET `/api/diary/icon/details`

前端服务 `iconDetails` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / iconDetails |
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
| query | `diaryEntryTypeId` | URL 参数 | [GET /api/diary/entry-type](API-teacher-diary#endpoint-042ffc697d0f) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/diary/icon/details",Object(n.a)({params:{diaryEntryTypeId:e}},t))
```

<a id="endpoint-f46724d97e87"></a>
## GET `/api/diary/student-info`

前端服务 `getStudentDiaryInfo` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getStudentDiaryInfo |
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
| query | `studentId` | URL 参数 | [GET /api/student/list](API-teacher-student#endpoint-c3f0d826a40e), [GET /api/course/students](API-teacher-course#endpoint-a84d7d961c28) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/diary/student-info",Object(n.a)({params:{studentId:e}},t))
```

<a id="endpoint-b951b2ceb180"></a>
## GET `/api/diary/type/details`

前端服务 `typeDetails` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / typeDetails |
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
| query | `diaryEntryTypeId` | URL 参数 | [GET /api/diary/entry-type](API-teacher-diary#endpoint-042ffc697d0f) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/diary/type/details",Object(n.a)({params:{diaryEntryTypeId:e}},t))
```

<a id="endpoint-5ba856222a8a"></a>
## GET `/api/diary/type/list`

前端服务 `typeList` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / typeList |
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

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/diary/type/list",e)
```

<a id="endpoint-64ec5b97b63d"></a>
## GET `/api/diary/type/page`

前端服务 `typePage` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / typePage |
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

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/diary/type/page",Object(n.a)({params:e},t))
```

<a id="endpoint-da8b1afa9da6"></a>
## POST `/api/diary/`

前端服务 `saveDiary` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / saveDiary |
| 契约 | unstable |
| 安全分类 | externalEffect |
| 外部副作用 | True |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 具有外部副作用；真实测试须逐项获得许可。

> 安全性未完整确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| — | 未观察到具名参数 | — | 认证头和学校上下文由会话管理 |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.post("/diary/",e,t)
```

<a id="endpoint-18df033bdc67"></a>
## PUT `/api/diary/icon/set`

前端服务 `setTypeIcon` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / setTypeIcon |
| 契约 | unstable |
| 安全分类 | externalEffect |
| 外部副作用 | True |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 具有外部副作用；真实测试须逐项获得许可。

> 安全性未完整确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| — | 未观察到具名参数 | — | 认证头和学校上下文由会话管理 |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.put("/diary/icon/set",e,t)
```

<a id="endpoint-39dcc805506c"></a>
## PUT `/api/diary/type/set`

前端服务 `setDiaryType` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / setDiaryType |
| 契约 | unstable |
| 安全分类 | externalEffect |
| 外部副作用 | True |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 具有外部副作用；真实测试须逐项获得许可。

> 安全性未完整确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| — | 未观察到具名参数 | — | 认证头和学校上下文由会话管理 |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.put("/diary/type/set",e,t)
```

<a id="endpoint-8bf5bde01b7c"></a>
## PUT `/api/diary/type/switch-enable`

前端服务 `switchDiaryTypeEnable` 声明的行为日记接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / switchDiaryTypeEnable |
| 契约 | unstable |
| 安全分类 | externalEffect |
| 外部副作用 | True |
| 安全性已确认 | False |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；不稳定接口。

> 完整请求或响应契约尚未确认，mock 不代表真实行为已验证。

> 具有外部副作用；真实测试须逐项获得许可。

> 安全性未完整确认，禁止用于自动真实测试。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `enable` | URL 参数 | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |
| query | `primaryTypeId` | URL 参数 | [GET /api/diary/primary-type](API-teacher-diary#endpoint-f72f75be97e8) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.put("/diary/type/switch-enable",{},Object(n.a)({params:{primaryTypeId:e,enable:t}},a))
```

