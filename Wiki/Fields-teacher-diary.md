# teacher-diary 字段参考

字段注释说明已确认语义。时间型字段以模型类型和端点单位说明为准；未知字段保留完整结构，不假造标签或评分单位。所有 DTO 额外保留 `additionalFields` 和 `presentFields`。

## `TeacherDiaryByStudentGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `conductPoints` | `Int` | 行为积分汇总 | — |
| `diaryEntryItemResponsePagedList` | `TeacherDiaryByStudentGETResponseDiaryEntryItemResponsePagedList` | 日记记录的分页集合 | — |
| `housePoints` | `Int` | 学院积分汇总 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDiaryByStudentGETResponseDiaryEntryItemResponsePagedList`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherDiaryByStudentGETResponseDiaryEntryItemResponsePagedListItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDiaryByStudentGETResponseDiaryEntryItemResponsePagedListItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `confidential` | `Bool` | 是否保密记录 | — |
| `createTime` | `Int` | 创建时刻，Unix 毫秒 | — |
| `creator` | `String` | 创建者显示信息 | — |
| `description` | `String` | 业务说明或富文本内容 | — |
| `diaryEntryId` | `Int` | 日记记录标识 | — |
| `diaryEntryType` | `String` | 日记子类型中文名称 | — |
| `diaryEntryTypeEn` | `String` | 日记子类型英文名称 | — |
| `editFlag` | `Bool` | 当前记录是否可编辑 | — |
| `followUpDate` | `Int` | 后续跟进日期，Unix 毫秒 | — |
| `modifier` | `String` | 最后修改者显示信息 | — |
| `modifyTime` | `Int` | 最后修改时刻，Unix 毫秒 | — |
| `notice` | `Bool` | 是否启用服务端通知标记 | — |
| `points` | `Int` | 本次行为积分 | — |
| `primaryType` | `String` | 日记主类型中文名称 | — |
| `primaryTypeEn` | `String` | 日记主类型英文名称 | — |
| `removeFlag` | `Bool` | 记录是否已删除 | — |
| `responseList` | `[JSONValue]` | 完整响应记录集合 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDiaryEntriesGETResponse`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `items` | `[TeacherDiaryEntriesGETResponseItemsItem]` | 当前页的完整记录 | — |
| `pageCurrent` | `Int` | 页码，从 1 开始 | — |
| `pageSize` | `Int` | 分页大小，以记录条数为单位 | — |
| `totalItem` | `Int` | 满足条件的总记录数 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDiaryEntriesGETResponseItemsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `className` | `String` | 主班级名称 | — |
| `conductPoints` | `Int` | 行为积分汇总 | — |
| `countNum` | `Int` | 当前节点记录数量 | — |
| `diaryEntryStatistics` | `[TeacherDiaryEntriesGETResponseItemsItemDiaryEntryStatisticsItem]` | 日记积分或行为统计 | — |
| `diaryIds` | `[Int]` | 关联日记标识集合 | — |
| `dormitoryName` | `String` | 宿舍显示名称 | — |
| `gender` | `SemanticValue` | 性别语义值 | gender |
| `house` | `String` | 学院名称 | — |
| `housePoints` | `JSONValue?` | 学院积分汇总；允许为空或缺失 | — |
| `icons` | `[JSONValue]` | 类型关联图标 | — |
| `modifyTime` | `Int` | 最后修改时刻，Unix 毫秒 | — |
| `negativePoints` | `Int` | 负向行为积分 | — |
| `notePoints` | `Int` | 备注类记录积分 | — |
| `points` | `Int` | 本次行为积分 | — |
| `positivePoints` | `Int` | 正向表现积分 | — |
| `selfStudyRoomName` | `String` | 自习室显示名称 | — |
| `studentAvatar` | `String` | 学生头像资源地址 | — |
| `studentId` | `Int` | 学生标识，来自学生列表或课程学生名单 | — |
| `studentName` | `String` | 学生显示姓名 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDiaryEntriesGETResponseItemsItemDiaryEntryStatisticsItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `countNum` | `Int` | 当前节点记录数量 | — |
| `diaryEntryTypeId` | `Int` | 日记子类型标识，来自对应主类型的子类型选项 | — |
| `enValue` | `String` | 选项的英文显示文本 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDiaryEntryTypeGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `JSONValue?` | 选项附加元数据，类型随业务域变化；允许为空或缺失 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

## `TeacherDiaryPrimaryTypeGETResponseItem`

| 字段 | Swift 类型 | 含义 / 空值 / 来源 | 语义域 |
|---|---|---|---|
| `disable` | `Bool` | 是否禁用该选项 | — |
| `enValue` | `String` | 选项的英文显示文本 | — |
| `extraValue` | `Bool` | 选项附加元数据，类型随业务域变化 | — |
| `highPoints` | `Int?` | 此日记主类型的积分上限；允许为空或缺失 | — |
| `key` | `Int` | 选项标识，供后续请求使用 | — |
| `lowPoints` | `Int?` | 此日记主类型的积分下限；允许为空或缺失 | — |
| `special` | `Bool` | 是否需要特殊日记字段 | — |
| `value` | `String` | 选项值或显示文本；具体角色由所属选项字典决定 | — |

| `additionalFields` | `[String: JSONValue]` | 新服务器字段完整保留 | — |
| `presentFields` | `Set<String>` | 原始键集合，区分缺失和显式 null | — |

