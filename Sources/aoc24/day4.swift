func day4(_ input: String) -> Int {
    let lines = input.split(separator: "\n")
    var data: [[Character]] = []
    for line in lines {
        let row: [Character] = Array(line)
        data.append(row)
    }
    var found: Set<Hit> = []
    for (y, row) in data.enumerated() {
        for (x, _) in row.enumerated() {
            found = found.union(explore(x: x, y: y, data, "XMAS"))
        }
    }
    return found.count
}

enum Dir: CaseIterable {
    case up
    case up_right
    case up_left
    case down
    case down_right
    case down_left
    case left
    case right
}

struct Hit: Hashable {
    let x: Int
    let y: Int
    let end_x: Int
    let end_y: Int
    init(_ x: Int, _ y: Int, _ end_x: Int, _ end_y: Int) {
        self.x = x
        self.y = y
        self.end_x = end_x
        self.end_y = end_y
    }
}

func explore(x: Int, y: Int, _ data: borrowing [[Character]], _ word: String) -> Set<Hit> {
    var found: Set<Hit> = []
    check_all: for dir in Dir.allCases {
        // i = 0..<word.count
        var new_y: Int = y
        var new_x: Int = x
        for (i, char) in word.enumerated() {
            switch dir {
            case .up:
                new_y = y - i
                new_x = x
            case .up_right:
                new_y = y - i
                new_x = x + i
            case .up_left:
                new_y = y - i
                new_x = x - i
            case .down:
                new_y = y + i
                new_x = x
            case .down_right:
                new_y = y + i
                new_x = x + i
            case .down_left:
                new_y = y + i
                new_x = x - i
            case .left:
                new_y = y
                new_x = x - i
            case .right:
                new_y = y
                new_x = x + i
            }
            guard new_y >= 0 && new_y < data.count else {
                continue check_all
            }
            guard new_x >= 0 && new_x < data[0].count else {
                continue check_all
            }
            if data[new_y][new_x] != char {
                continue check_all
            }
        }
        found.insert(Hit(x, y, new_x, new_y))
    }
    return found
}
