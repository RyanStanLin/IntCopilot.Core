# teacher-grade-book API 参考

本文由公开端点目录生成。接口方法不决定安全性。字段含义不足时保持未确认说明，原始私人材料不随文档发布。

<a id="endpoint-a0417dae17aa"></a>
## GET `/api/grade-book/grade-book`

读取成绩簿数据；业务操作对应前端名称 `getGradeBook`，完整参数与结构见下表。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getGradeBook |
| 契约 | stable |
| 安全分类 | readOnly |
| 外部副作用 | False |
| 安全性已确认 | True |
| 原始抓包覆盖 | True |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| query | `courseId` | URL 参数 | [GET /api/course/cascadeBySchoolYear](API-teacher-course#endpoint-8fe1424bdaf0) |
| query | `schoolYearId` | URL 参数 | [GET /api/semester/currentSchoolYear](API-teacher-semester#endpoint-ff61d57df37c), [GET /api/dropDown/schoolYearRuleList](API-teacher-dropDown#endpoint-73c464f44d8c) |
| query | `studentId` | URL 参数 | [GET /api/student/list](API-teacher-student#endpoint-c3f0d826a40e), [GET /api/course/students](API-teacher-course#endpoint-a84d7d961c28) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

响应类型：`TeacherGradeBookGradeBookGETResponse`。完整嵌套字段见 [字段参考](Fields-teacher-grade-book)。新增字段进入 `additionalFields`，混合或未确定结构保留 `JSONValue`。

使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。

### 证据与验证范围

- providedCapture: `capture:2431`
- providedCapture: `capture:1763`
- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/grade-book/grade-book",Object(n.a)({params:{courseId:e}},t))
```

<a id="endpoint-cb299db09322"></a>
## GET `/api/grade-book/grade-book/`

前端服务 `getStudentGradeBook` 声明的成绩簿接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getStudentGradeBook |
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
| query | `schoolYearId` | URL 参数 | [GET /api/semester/currentSchoolYear](API-teacher-semester#endpoint-ff61d57df37c), [GET /api/dropDown/schoolYearRuleList](API-teacher-dropDown#endpoint-73c464f44d8c) |
| query | `studentId` | URL 参数 | [GET /api/student/list](API-teacher-student#endpoint-c3f0d826a40e), [GET /api/course/students](API-teacher-course#endpoint-a84d7d961c28) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/grade-book/grade-book/",Object(n.a)({params:{studentId:e,schoolYearId:t}},a))
```

<a id="endpoint-ccc87b05e852"></a>
## GET `/api/grade-book/scale`

前端服务 `getGradeBookScale` 声明的成绩簿接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getGradeBookScale |
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
return y.get("/grade-book/scale",e)
```

<a id="endpoint-78a864f92e29"></a>
## POST `/api/grade-book/custom-column/score`

前端服务 `updateCustomColumnScore` 声明的成绩簿接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / updateCustomColumnScore |
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
return y.post("/grade-book/custom-column/score",e,t)
```

<a id="endpoint-b3180b789a33"></a>
## PUT `/api/grade-book/course-column-lock`

前端服务 `setCourseColumnLock` 声明的成绩簿接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / setCourseColumnLock |
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
return y.put("/grade-book/course-column-lock",e,t)
```

<a id="endpoint-269b4be9d0fb"></a>
## PUT `/api/grade-book/top-score`

前端服务 `setCustomColumnMaxScore` 声明的成绩簿接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / setCustomColumnMaxScore |
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
return y.put("/grade-book/top-score",e,t)
```

