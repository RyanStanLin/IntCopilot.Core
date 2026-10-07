# teacher-cca API 参考

本文由公开端点目录生成。接口方法不决定安全性。字段含义不足时保持未确认说明，原始私人材料不随文档发布。

<a id="endpoint-e2fb2087a962"></a>
## GET `/api/cca/curriculum/alternativeInfo`

前端服务 `getAlternativeInfo` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getAlternativeInfo |
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
| query | `ccaCurriculumStudentId` | URL 参数 | 来自同业务域上游选项或记录；未确认的关联须通过实验入口使用 |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/cca/curriculum/alternativeInfo",Object(n.a)({params:{ccaCurriculumStudentId:e}},t))
```

<a id="endpoint-d7ba5547c867"></a>
## GET `/api/cca/curriculum/applyInfo`

前端服务 `getApplyInfo` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getApplyInfo |
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
| query | `courseId` | URL 参数 | [GET /api/course/cascadeBySchoolYear](API-teacher-course#endpoint-8fe1424bdaf0) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/cca/curriculum/applyInfo",Object(n.a)({params:{courseId:e}},t))
```

<a id="endpoint-0fc42ce9bf52"></a>
## GET `/api/cca/curriculum/cca-schedule/{pathSuffix}`

前端服务 `getCCAScheduleList` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getCCAScheduleList |
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

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/cca/curriculum/cca-schedule/".concat(e,"/drop-down"),Object(n.a)({params:{}},t))
```

<a id="endpoint-15eff070460e"></a>
## GET `/api/cca/curriculum/ccaExportInfo`

前端服务 `getCcaExportInfo` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getCcaExportInfo |
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
| query | `type` | URL 参数 | 本业务域类型；不能跨业务域套用代码表 |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/cca/curriculum/ccaExportInfo",Object(n.a)({params:{type:e,start:t,end:a}},r))
```

<a id="endpoint-1fc2112f1bfa"></a>
## GET `/api/cca/curriculum/ccaWeekly`

前端服务 `getClassArrangesByStudentAndWeek` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getClassArrangesByStudentAndWeek |
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
return y.get("/cca/curriculum/ccaWeekly",Object(n.a)({params:e},t))
```

<a id="endpoint-51fc221ee384"></a>
## GET `/api/cca/curriculum/detail`

前端服务 `detail` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / detail |
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
| query | `courseId` | URL 参数 | [GET /api/course/cascadeBySchoolYear](API-teacher-course#endpoint-8fe1424bdaf0) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/cca/curriculum/detail",Object(n.a)({params:{courseId:e}},t))
```

<a id="endpoint-28e6e1430653"></a>
## GET `/api/cca/curriculum/exportInfo`

前端服务 `getExportInfo` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getExportInfo |
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
| query | `type` | URL 参数 | 本业务域类型；不能跨业务域套用代码表 |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/cca/curriculum/exportInfo",Object(n.a)({params:{type:e,start:t,end:a}},r))
```

<a id="endpoint-90505afcc021"></a>
## GET `/api/cca/curriculum/exportStudentInfo`

前端服务 `getExportStudentInfo` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getExportStudentInfo |
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

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/cca/curriculum/exportStudentInfo",Object(n.a)({params:{start:e,end:t}},a))
```

<a id="endpoint-a2e7e687f294"></a>
## GET `/api/cca/curriculum/list`

前端服务 `list` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / list |
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
return y.get("/cca/curriculum/list",Object(n.a)({params:e},t))
```

<a id="endpoint-6dd5b9a5bde4"></a>
## GET `/api/cca/curriculum/reportList`

前端服务 `reportList` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / reportList |
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
return y.get("/cca/curriculum/reportList",Object(n.a)({params:e},t))
```

<a id="endpoint-e75fdd6183b5"></a>
## GET `/api/cca/curriculum/students`

前端服务 `students` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / students |
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
return y.get("/cca/curriculum/students",Object(n.a)({params:e},t))
```

<a id="endpoint-265ff92e6393"></a>
## GET `/api/cca/curriculum/unEnrolled`

前端服务 `getUnEnrolled` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / getUnEnrolled |
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

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-teacher/3.1.6/js/app.e4126912.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return y.get("/cca/curriculum/unEnrolled",Object(n.a)({params:{start:e,end:t}},a))
```

<a id="endpoint-87363c7bdc3f"></a>
## POST `/api/cca/curriculum/applyBatch`

前端服务 `applyBatch` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / applyBatch |
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
return y.post("/cca/curriculum/applyBatch",e,t)
```

<a id="endpoint-90b861a5f29c"></a>
## PUT `/api/cca/curriculum/reject`

前端服务 `reject` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | teacher / reject |
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
return y.put("/cca/curriculum/reject",e,t)
```

