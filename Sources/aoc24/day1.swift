func countDistance(_ input: String) -> Int {
    var left: [Int] = []
    var right: [Int] = []
    for line in input.split(separator: "\n") {
        let split = line.split(separator: " ")
        left.append(Int(split[0])!)
        right.append(Int(split[1])!)
    }
    left.sort()
    right.sort()
    var total = 0
    for (l, r) in zip(left, right) {
        total += abs(l - r)
    }
    return total
}

func similarity(_ input: String) -> Int {
    var left: [Int] = []
    var right: [Int] = []
    for line in input.split(separator: "\n") {
        let split = line.split(separator: " ")
        left.append(Int(split[0])!)
        right.append(Int(split[1])!)
    }
    var counts: [Int: Int] = [:]
    for num in right {
        if let count = counts[num] {
            counts[num]! += 1
        } else {
            counts[num] = 1
        }
    }
    var total = 0
    for l in left {
        if let count = counts[l] {
            total += l * count
        }
    }

    return total
}
