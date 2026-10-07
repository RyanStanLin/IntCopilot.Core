# teacher-message 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherMessageFromDetailGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `canDelete` | `Bool` | 当前账号是否可删除此收发记录 | — |
| `content` | `String` | 正文或学生提交内容，可能包含富文本 | — |
| `fromMember` | `TeacherMessageFromDetailGETResponseItemFromMember` | 发送方完整信息 | — |
| `masterRecordId` | `JSONValue?` | 消息收发关联记录标识；允许为空或缺失 | — |
| `messageMasterId` | `Int` | 消息主记录标识，来自消息列表 | — |
| `resources` | `[JSONValue]` | 完整附件资源引用 | — |
| `selfDelete` | `Bool` | 当前账号是否已删除此收发记录 | — |
| `sendMail` | `Bool` | 是否同时发送邮件 | — |
| `sendTime` | `Int` | 消息发送时刻，Unix 毫秒 | — |
| `title` | `String` | 消息或公告标题 | — |
| `toParents` | `[TeacherMessageFromDetailGETResponseItemToParentsItem]` | 家长接收方 | — |
| `toStudents` | `[JSONValue]` | 学生接收方 | — |
| `toTeachers` | `[JSONValue]` | 教师接收方 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | unconfirmed:/api/message/fromDetail:type |
| `withdraw` | `Bool` | 消息是否已撤回 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMessageFromDetailGETResponseItemFromMember`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `enterDate` | `String` | 入学日期，Unix 毫秒 | — |
| `memberId` | `Int` | 当前消息成员标识，需结合 memberType 解释 | — |
| `memberType` | `String` | 消息成员身份类别 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `relationship` | `SemanticValue` | 家长与学生的关系 | relationship |
| `studentId` | `JSONValue?` | 学生标识，来自学生列表或课程学生名单；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMessageFromDetailGETResponseItemToParentsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `enterDate` | `String` | 入学日期，Unix 毫秒 | — |
| `memberId` | `Int` | 当前消息成员标识，需结合 memberType 解释 | — |
| `memberType` | `String` | 消息成员身份类别 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `relationship` | `SemanticValue` | 家长与学生的关系 | relationship |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMessageFromListGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherMessageFromListGETResponseItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMessageFromListGETResponseItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `content` | `String` | 正文或学生提交内容，可能包含富文本 | — |
| `fromMember` | `TeacherMessageFromListGETResponseItemsItemFromMember` | 发送方完整信息 | — |
| `messageMasterId` | `Int` | 消息主记录标识，来自消息列表 | — |
| `readNum` | `Int` | 已读收件人数量 | — |
| `sendTime` | `Int` | 消息发送时刻，Unix 毫秒 | — |
| `seqNum` | `Int` | 当前列表显示序号 | — |
| `title` | `String` | 消息或公告标题 | — |
| `toMembers` | `[TeacherMessageFromListGETResponseItemsItemToMembersItem]` | 接收方完整列表 | — |
| `withdraw` | `Bool` | 消息是否已撤回 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMessageFromListGETResponseItemsItemFromMember`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `enterDate` | `String` | 入学日期，Unix 毫秒 | — |
| `memberId` | `Int` | 当前消息成员标识，需结合 memberType 解释 | — |
| `memberType` | `String` | 消息成员身份类别 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `relationship` | `SemanticValue` | 家长与学生的关系 | relationship |
| `studentId` | `JSONValue?` | 学生标识，来自学生列表或课程学生名单；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMessageFromListGETResponseItemsItemToMembersItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `enterDate` | `String` | 入学日期，Unix 毫秒 | — |
| `memberId` | `Int` | 当前消息成员标识，需结合 memberType 解释 | — |
| `memberType` | `String` | 消息成员身份类别 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `relationship` | `SemanticValue` | 家长与学生的关系 | relationship |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMessageToListGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherMessageToListGETResponseItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMessageToListGETResponseItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `content` | `String` | 正文或学生提交内容，可能包含富文本 | — |
| `fromMember` | `TeacherMessageToListGETResponseItemsItemFromMember` | 发送方完整信息 | — |
| `important` | `Bool` | 是否重要消息 | — |
| `masterRecordId` | `JSONValue?` | 消息收发关联记录标识；允许为空或缺失 | — |
| `messageId` | `Int` | 消息记录标识 | — |
| `messageMasterId` | `Int` | 消息主记录标识，来自消息列表 | — |
| `readFlag` | `Bool` | 当前记录是否已读 | — |
| `sendTime` | `Int` | 消息发送时刻，Unix 毫秒 | — |
| `seqNum` | `Int` | 当前列表显示序号 | — |
| `title` | `String` | 消息或公告标题 | — |
| `toMember` | `TeacherMessageToListGETResponseItemsItemToMember` | 接收方完整信息 | — |
| `type` | `SemanticValue` | 本业务域类型；不能跨业务域套用代码表 | unconfirmed:/api/message/toList:type |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMessageToListGETResponseItemsItemFromMember`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `enterDate` | `String` | 入学日期，Unix 毫秒 | — |
| `memberId` | `Int` | 当前消息成员标识，需结合 memberType 解释 | — |
| `memberType` | `String` | 消息成员身份类别 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `relationship` | `SemanticValue` | 家长与学生的关系 | relationship |
| `studentId` | `JSONValue?` | 学生标识，来自学生列表或课程学生名单；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherMessageToListGETResponseItemsItemToMember`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `avatarUrl` | `String` | 头像资源地址 | — |
| `enName` | `String` | 英文名称，可能为空 | — |
| `enterDate` | `String` | 入学日期，Unix 毫秒 | — |
| `memberId` | `Int` | 当前消息成员标识，需结合 memberType 解释 | — |
| `memberType` | `String` | 消息成员身份类别 | — |
| `name` | `String` | 业务实体或选项名称 | — |
| `relationship` | `SemanticValue` | 家长与学生的关系 | relationship |
| `studentId` | `JSONValue?` | 学生标识，来自学生列表或课程学生名单；允许为空或缺失 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

