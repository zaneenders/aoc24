import Algorithms

func makeLines(_ input: String) -> [[Int]] {
    let lines = input.split(separator: "\n")
    return lines.map { $0.split(separator: " ").map { Int($0)! } }
}

func solve(_ nums: [[Int]]) -> Int {
    var count = 0
    for line in nums {
        switch solveLine(line) {
        case .safe:
            count += 1
        case .unsafe:
            count += 0
        }
    }
    return count
}

func solveLine(_ line: [Int]) -> Status {
    if line.count < 2 {
        return .safe
    }
    var rest = line
    var first = rest.removeFirst()
    guard let dir = compare(first, rest.first!) else {
        return .unsafe
    }
    while !rest.isEmpty {
        if let r = compare(first, rest.first!) {
            if r == dir {
                first = rest.removeFirst()
            } else {
                return .unsafe
            }
        } else {
            return .unsafe
        }
    }
    return .safe
}

func compare(_ left: Int, _ right: Int) -> Direction? {
    let diff = left - right
    let abs_diff = abs(diff)
    if abs_diff < 1 || abs_diff > 3 {
        return nil
    }
    if diff < 0 {
        // increasing
        return .increasing
    } else {
        // decreasing
        return .decreasing
    }
}

enum Direction: CustomDebugStringConvertible {
    case increasing
    case decreasing
    var debugDescription: String {
        switch self {
        case .decreasing:
            return "decreasing"
        case .increasing:
            return "increasing"
        }
    }
}

enum Status {
    case safe
    case unsafe
}

func solve2(_ nums: [[Int]]) -> Int {
    var count = 0
    for line in nums {
        switch checkLine(line) {
        case .safe:
            count += 1
        case .unsafe:
            count += 0
        }
    }
    return count
}

func checkLine(_ line: [Int]) -> Status {
    switch solveLine2(line) {
    case true:
        return .safe
    case false:
        for (i, _) in line.enumerated() {
            var copy1 = line
            copy1.remove(at: i)
            switch solveLine2(copy1) {
            case true:
                return .safe
            case false:
                ()
            }
        }
        return .unsafe
    }
}

func solveLine2(_ line: [Int]) -> Bool {
    var prev = 0
    for (i, window) in line.windows(ofCount: 2).enumerated() {
        let diff = window.reduce(into: 0) { partialResult, i in
            partialResult = i - partialResult
        }
        if abs(diff) < 1 || abs(diff) > 3 {
            return false
        }
        if i > 0 {
            if (prev < 0 && diff > 0) || (prev > 0 && diff < 0) {
                return false
            } else {
                prev = diff
            }
        } else {
            prev = diff
        }
    }
    return true
}
