import Testing

@testable import aoc24

@Test func day4Example() async throws {
    let input = """
        MMMSXXMASM
        MSAMXMSMSA
        AMXSXMAAMM
        MSAMASMSMX
        XMASAMXAMM
        XXAMMXXAMA
        SMSMSASXSS
        SAXAMASAAA
        MAMMMXMMMM
        MXMXAXMASX
        """
    #expect(18 == day4(input))
}

@Test func day4Star1() async throws {
    let input = try await getStringContents("inputs/day4.txt")
    #expect(2358 == day4(input))
}

@Test func day4Example2() async throws {
    let input = """
        MMMSXXMASM
        MSAMXMSMSA
        AMXSXMAAMM
        MSAMASMSMX
        XMASAMXAMM
        XXAMMXXAMA
        SMSMSASXSS
        SAXAMASAAA
        MAMMMXMMMM
        MXMXAXMASX
        """
    #expect(9 == day4Part2(input))
}

@Test func day4Star2() async throws {
    let input = try await getStringContents("inputs/day4.txt")
    #expect(1737 == day4Part2(input))
}
