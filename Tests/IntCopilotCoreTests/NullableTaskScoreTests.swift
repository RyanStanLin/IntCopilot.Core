import Foundation
import Testing
@testable import IntCopilotCore

@Test func ungradedParentTasksKeepNullAndMissingScores() throws {
    let original = try JSONDecoder().decode(JSONValue.self, from: fixtureData("parent-277.json"))
    var object = try #require(original.objectValue)
    var items = try #require(object["items"]?.arrayValue)
    var first = try #require(items.first?.objectValue)
    first["score"] = .null; first["newServerField"] = .string("example")
    var missing = first; missing.removeValue(forKey: "score")
    items = [.object(first), .object(missing)]; object["items"] = .array(items)
    let input = JSONValue.object(object)
    let response = try JSONDecoder().decode(ParentTaskMergeListGETResponse.self, from: JSONEncoder().encode(input))
    #expect(response.items.allSatisfy { $0.score == nil })
    #expect(response.items[0].presentFields.contains("score"))
    #expect(!response.items[1].presentFields.contains("score"))
    #expect(response.items[0].additionalFields["newServerField"] == .string("example"))
    let roundTrip = try JSONDecoder().decode(JSONValue.self, from: JSONEncoder().encode(response))
    #expect(roundTrip == input)
}

@Test func ungradedParentTaskDetailDoesNotInventZero() throws {
    var object = try #require(JSONDecoder().decode(JSONValue.self, from: fixtureData("parent-286.json")).objectValue)
    object["score"] = .null
    let input = JSONValue.object(object)
    let response = try JSONDecoder().decode(ParentTaskDetailGETResponse.self, from: JSONEncoder().encode(input))
    #expect(response.score == nil)
    #expect(response.presentFields.contains("score"))
    #expect(try JSONDecoder().decode(JSONValue.self, from: JSONEncoder().encode(response)) == input)
    object["score"] = .number(1.5)
    let graded = try JSONDecoder().decode(ParentTaskDetailGETResponse.self, from: JSONEncoder().encode(JSONValue.object(object)))
    #expect(graded.score == 1.5)
}
