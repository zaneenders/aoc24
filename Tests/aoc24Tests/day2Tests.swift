import Testing

@testable import aoc24

@Test func dayTwoExample() async throws {
    let input = """
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
        """
    let nums = makeLines(input)
    #expect(2 == solve(nums))
}

@Test func dayTwoStarOne() async throws {
    let input = try await getStringContents("inputs/daytwo.txt")
    let nums = makeLines(input)
    #expect(585 == solve(nums))
}

@Test func dayTwoExample2() async throws {
    let input = """
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
        """
    let nums = makeLines(input)
    #expect(4 == solve2(nums))
}

@Test func dayTwoStarTwo() async throws {
    let input = try await getStringContents("inputs/daytwo.txt")
    let nums = makeLines(input)
    #expect(626 == solve2(nums))
}
