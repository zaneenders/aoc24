import Testing

@testable import aoc24

@Test func dayThreeExample() async throws {
    let input = """
        xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
        """
    #expect(161 == day3(input))
}
@Test func dayThreeStarOne() async throws {
    let input = try await getStringContents("inputs/daythree.txt")
    #expect(174_561_379 == day3(input))
}

@Test func dayThreeExample2() async throws {
    let input = """
        xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
        """
    #expect(48 == day3Part2(input))
}

@Test func dayThreeStarTwo() async throws {
    let input = try await getStringContents("inputs/daythree.txt")
    #expect(106_921_067 == day3Part2(input))
}
