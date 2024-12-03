import RegexBuilder

func day3(_ input: String) -> Int {
    let mulRegx = Regex {
        "mul("
        Capture {
            OneOrMore(.digit)
        }
        ","
        Capture {
            OneOrMore(.digit)
        }
        ")"
    }
    var sum = 0
    let matches = input.matches(of: mulRegx)
    print(matches.count)
    for match in matches {
        // print(match.output.0)
        sum += Int(match.output.1)! * Int(match.output.2)!
    }
    return sum
}

func day3Part2(_ input: String) -> Int {
    let check = Regex {
        ChoiceOf {
            Regex {
                "mul("
                Capture {
                    OneOrMore(.digit)
                }
                ","
                Capture {
                    OneOrMore(.digit)
                }
                ")"
            }
            "do()"
            "don't()"
        }
    }

    let matches = input.matches(of: check)
    var ops: [Op] = []
    for match in matches {
        if match.output.0.contains("mul") {
            ops.append(.mul(Int(match.output.1!)!, Int(match.output.2!)!))
        } else if match.output.0.contains("'") {
            ops.append(.off)
        } else {
            ops.append(.on)
        }
    }
    var sum = 0
    var on = true
    for op in ops {
        switch op {
        case .off:
            on = false
        case .on:
            on = true
        case let .mul(l, r):
            if on {
                sum += l * r
            }
        }
    }
    return sum
}

enum Op {
    case on
    case off
    case mul(Int, Int)
}
