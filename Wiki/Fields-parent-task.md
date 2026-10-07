# parent-task 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `ParentTaskDetailGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `comments` | `String` | 评语或备注内容 | — |
| `content` | `String` | 正文或学生提交内容，可能包含富文本 | — |
| `courseName` | `String` | 课程名称 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `endDate` | `Int` | 结束日期或截止时刻，Unix 毫秒 | — |
| `inTotal` | `Bool` | 是否计入汇总成绩 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `online` | `Bool` | 是否线上提交或线上状态 | — |
| `overDeadline` | `Bool` | 是否已超过截止时间 | — |
| `resources` | `[JSONValue]` | 完整附件资源引用 | — |
| `score` | `Double?` | 作业分数；单位由任务评分规则决定；未评分或服务端缺失时为 nil，不当作零分 | — |
| `scoreFlag` | `Bool` | 是否启用评分 | — |
| `status` | `Bool` | 本业务域状态；不能跨业务域套用代码表 | — |
| `studentResources` | `[JSONValue]` | 学生提交的附件资源 | — |
| `subjectName` | `String` | 学科名称 | — |
| `tag` | `SemanticValue` | 评分备注标签，需按评分业务解析 | unconfirmed:/api/task/detail:tag |
| `taskId` | `Int` | 任务标识，来自任务列表 | — |
| `taskStudentId` | `Int` | 学生任务关联标识，来自任务列表或任务学生记录 | — |
| `topScore` | `Int` | 评分上限或统计最高分，依端点业务区分 | — |
| `typeName` | `String` | 业务类型名称 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentTaskMergeListGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[ParentTaskMergeListGETResponseItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `ParentTaskMergeListGETResponseItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `creatorName` | `String` | 创建者姓名 | — |
| `displayName` | `String` | 前端使用的显示名称 | — |
| `endDate` | `Int` | 结束日期或截止时刻，Unix 毫秒 | — |
| `entityId` | `Int` | 混合列表实体标识；任务条目与教学资源条目的标识语义不同 | — |
| `isRead` | `Bool` | 当前条目是否已读 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `online` | `Bool` | 是否线上提交或线上状态 | — |
| `score` | `Double?` | 作业分数；单位由任务评分规则决定；未评分或服务端缺失时为 nil，不当作零分 | — |
| `startDate` | `Int` | 开始日期或时刻，Unix 毫秒 | — |
| `status` | `Bool` | 本业务域状态；不能跨业务域套用代码表 | — |
| `topScore` | `Int` | 评分上限或统计最高分，依端点业务区分 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | taskFeedType |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

