# 新增 API 完整指南

1. 确认平台、业务目的、权限和实际副作用；HTTP 方法只作传输信息。记录字段、空值、单位、分页、日期时区以及上游参数来源。
2. 先把接口加入 `Sources/IntCopilotCore/Resources/EndpointCatalog.json`。填写唯一 ID、来源证据、风险独立标记、`queryParameters`、`bodyFields`、`bodyFieldTypes`、依赖和告警。信息不足时保持 `unstable`；未知安全性禁止自动真实测试。
3. 抓包只在本地私有目录保存。脱敏要让学生、课程、任务等关联一致，同时不能反推真实值。`Tools/build_contracts.py --captures <private-dir> --scripts <private-public-script-cache>` 使用保存在私有脚本缓存中的 HMAC 随机盐；盐、映射和原始数据不能提交。
4. 为确认的响应创建独立业务域 DTO，实现 `CapturedResponse`，保留新增字段与缺失/null。嵌套 DTO 单独定义。每个字段注释须说明语义、单位、空值及关联来源；不在其他代码中添加说明性注释。
5. 状态只能按业务域解析。动态字典优先使用 `SemanticOption`，填写学校与上游依赖；静态映射必须记录证据。未知值要明确为未识别，不建立全局 1001/1011 映射。
6. 为稳定接口增加 `CapturedEndpoint<Response>` 常量。通过 `session.call` 使用现有认证和错误机制；不要在业务服务中复制网络实现、Cookie 或 Token 管理。
7. 如属学生/课程操作，在 scope 中组织读取依赖，绑定学校后调用。需要用户选择时返回具名对象。每次写入单独暴露，不把读取选项的函数变成隐式写入。`schoolYearId` 常规依赖由会话获取。
8. 添加脱敏 fixture、路由与参数 mock、解析/编码往返、未知字段和同码异义验证；写入确保 401 不自动重放。新的认证或 Cookie 行为必须加入对应并发/退出测试。
9. 把操作 SOP 源码放进测试 target，编译并用 mock 验证调用顺序。运行 `python3 Tools/build_wiki.py` 生成参考页面；手写 Wiki 说明业务选择、失败处理与撤回限制。
10. 运行 `swift test`、`swift build -c release`、隐私审计和全部 Apple 平台 CI。审查 Git diff 和历史。仅在完整证据和验证满足后迁入稳定入口。

目录生成器只负责声明、结构和脱敏，不代表人工业务分析完成。公开脚本的 minified 请求表达式是证据数据，SDK 不执行其中的 JavaScript。新增字段语义不清楚时明确标注，不能因为生成成功就声称已理解。

Wiki 源文件随主仓库版本管理。更新后复制 `Wiki/*.md` 到原生 Wiki clone，正常提交并 push；不要覆盖 Wiki 的 `.git`。发布 tag 前应确认两个仓库和 CI 一致。
