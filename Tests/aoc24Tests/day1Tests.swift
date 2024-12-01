import Testing

@testable import aoc24

@Test func dayOneExample() async throws {
    let input = """
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
        """
    let total = countDistance(input)
    #expect(total == 11)
}

@Test func dayOneStarOne() async throws {
    let contents = try await getStringContents("inputs/dayone.txt")
    let total = countDistance(contents)
    print(total)
}

@Test func dayOneStartTwo() async throws {
    let input = """
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
        """
    let contents = try await getStringContents("inputs/dayone.txt")
    let total = similarity(contents)
    print(total)
}
