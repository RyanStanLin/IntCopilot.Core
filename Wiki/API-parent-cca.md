# parent-cca API 参考

本文由公开端点目录生成。接口方法不决定安全性。字段含义不足时保持未确认说明，原始私人材料不随文档发布。

<a id="endpoint-f01389cbfa1d"></a>
## GET `/api/cca/curriculum/detail`

前端服务 `detail` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / detail |
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
| query | `courseId` | URL 参数 | [GET /api/dropDown/relatedAllCourses](API-parent-dropDown#endpoint-2f178d559578) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/cca/curriculum/detail",Object(n["a"])({params:{courseId:e}},t))
```

<a id="endpoint-0e13923890fe"></a>
## GET `/api/cca/curriculum/list`

前端服务 `list` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / list |
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
return h.get("/cca/curriculum/list",Object(n["a"])({params:e},t))
```

<a id="endpoint-d90b3ca4b261"></a>
## PUT `/api/cca/curriculum/apply`

前端服务 `apply` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / apply |
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

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.put("/cca/curriculum/apply",e,t)
```

<a id="endpoint-be34d0157f44"></a>
## PUT `/api/cca/curriculum/apply/{pathSuffix}`

前端服务 `applyCCA` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / applyCCA |
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

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.put("/cca/curriculum/apply/".concat(e,"/").concat(t),{},Object(n["a"])({params:{}},a))
```

<a id="endpoint-a84166348113"></a>
## PUT `/api/cca/curriculum/cancelApply`

前端服务 `cancelApply` 声明的前端业务接口。具体行为以证据表达式为准，未确认部分禁止猜测为稳定功能。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / cancelApply |
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
| query | `courseId` | URL 参数 | [GET /api/dropDown/relatedAllCourses](API-parent-dropDown#endpoint-2f178d559578) |
| query | `studentId` | URL 参数 | [GET /api/student/list](API-parent-student#endpoint-ddd046aba236) |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

空响应以 `MutationAcknowledgement` 保留确认与 HTTP 状态，非 JSON 或未确认结构以完整字节/JSON 保留。不得从空响应制造记录 ID。

业务实验契约使用 `client.experimental.invoke`；认证端点只能用专用认证流程。门户用户资料及独立打印抓包作为辅助证据记录，不扩大门户业务 API 或隐式跨域认证。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.put("/cca/curriculum/cancelApply",{},Object(n["a"])({params:{courseId:e,studentId:t}},a))
```

