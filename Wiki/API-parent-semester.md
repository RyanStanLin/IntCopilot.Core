# parent-semester API 参考

本文由公开端点目录生成。接口方法不决定安全性。字段含义不足时保持未确认说明，原始私人材料不随文档发布。

<a id="endpoint-d8164f3d282d"></a>
## GET `/api/semester/currentSchoolYear`

取得当前 schoolYearId 及学年名称、开始与结束毫秒时间。

| 属性 | 内容 |
|---|---|
| 平台 / 前端名称 | parent / getCurrentSchoolYear |
| 契约 | stable |
| 安全分类 | readOnly |
| 外部副作用 | False |
| 安全性已确认 | True |
| 原始抓包覆盖 | False |
| 权限 | 当前平台账号、所选学校及对应业务服务端权限；以每次请求的服务器校验为准 |

> 用户原始抓包未覆盖；经补充只读实测确认的引导或上下文接口。

### 参数与来源

| 位置 | 字段 | JSON 类型 | 依赖 / 语义 |
|---|---|---|---|
| — | 未观察到具名参数 | — | 认证头和学校上下文由会话管理 |

字段列表区分抓包可确认内容与前端表达式；表达式中的其他可选字段未实测时不能当作完整契约证明。

### 响应与调用

响应类型：`ParentSemesterCurrentSchoolYearGETResponse`。完整嵌套字段见 [字段参考](Fields-parent-semester)。新增字段进入 `additionalFields`，混合或未确定结构保留 `JSONValue`。

使用对应端点常量和 `client.call(endpoint, input:)`，或 SOP 中的具名服务。选项代码使用 `APIParameter.selection`；普通标识使用 `.id`。

### 证据与验证范围

- frontendScript: [公开脚本](https://njstatic.dipont.com/school-magic-parent/3.0.9/js/chunk-common.1810b865.js)
- readOnlyObservation: `read-only:2026-10-07:parent-current-school-year`

mock 验证 SDK 编码/解析和顺序；不能单独证明真实平台契约。只读补充验证仅覆盖报告中列出的读取行为。业务写入未做真实测试。

```javascript
return h.get("/semester/currentSchoolYear",e)
```

