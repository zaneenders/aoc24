func day5(_ input: String) -> Int {
    // Parse rules
    var rules: [String] = []
    let lines = input.split(maxSplits: Int.max, omittingEmptySubsequences: false) {
        .newlineSequence
    }
    var toggle = false
    var updates: [String] = []

    // Parse input
    for line in lines {
        if line.count == 0 {
            toggle.toggle()
        } else {
            if toggle {
                updates.append("\(line)")
            } else {
                rules.append("\(line)")
            }
        }
    }
    var rule_set: [Int: [Int]] = [:]
    for rule in rules {
        let pair = rule.split(separator: "|")
        let index = Int(pair[1])!
        let value = Int(pair[0])!
        if let _ = rule_set[index] {
            rule_set[index]!.append(value)
        } else {
            rule_set[index] = [value]
        }
    }
    var valids: [[Int]] = []

    // check inputs if they are valid
    update_loop: for update in updates {
        let update_arr: [Int] = update.split(separator: ",").map { Int($0)! }
        for (i, value) in update_arr.enumerated() {
            let t = i + 1
            if t > update.count - 1 {
                continue update_loop
            }
            if let after = rule_set[value] {
                for a in after {
                    if update_arr[t...].contains(a) {
                        print(after, update_arr[t...], a)
                        continue update_loop
                    }
                }
            }
        }
        valids.append(update_arr)
    }
    var sum = 0
    for valid in valids {
        let i = valid.count / 2
        sum += valid[i]
    }
    // sum mid numbers of valid rows
    return sum
}
