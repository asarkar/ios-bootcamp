import Foundation

enum CalculatorButtonType {
    case clear
    case eq
    case unaryOp
    case binaryOp
    case num
}

protocol CalculatorButtonProtocol {
    func action(n1: String, n2: String?) -> String
    var type: CalculatorButtonType { get }
}

class CalculatorButton: CalculatorButtonProtocol, CustomStringConvertible, CustomDebugStringConvertible {
    let type: CalculatorButtonType
    let label: String
    var description: String { label }
    var debugDescription: String { description }
    
    init(_ label: String, type: CalculatorButtonType) {
        self.label = label
        self.type = type
    }
    
    func action(n1: String, n2: String?) -> String {
        fatalError("Not implemented")
    }
    
    fileprivate func format(_ n: Decimal?) -> String {
        return String(describing: n!)
    }
}

class EqualsButton: CalculatorButton {
    convenience init(_ label: String) {
        self.init(label, type: .eq)
    }
}

class ClearButton: CalculatorButton {
    convenience init(_ label: String) {
        self.init(label, type: .clear)
    }
}

class NumberButton: CalculatorButton {
    convenience init(_ label: String) {
        self.init(label, type: .num)
    }
    override func action(n1: String, n2: String?) -> String {
        let hasDecimal = n1.contains(K.Number.Decimal.label)
        if hasDecimal && (self === K.Number.Decimal) {
            return n1
        }
        if self === K.Number.Decimal {
            return n1 + label
        }
        return format(Decimal(string: n1 + label))
    }
}

class UnaryOperatorButton: CalculatorButton {
    convenience init(_ label: String) {
        self.init(label, type: .unaryOp)
    }
    override func action(n1: String, n2: String?) -> String {
        guard let n = Decimal(string: n1) else {
            fatalError("\(n1) is not a number")
        }
        if label == K.Operator.Not.label {
            return format(-n)
        } else {
            return format(n / 100)
        }
    }
}

class BinaryOperatorButton: CalculatorButton {
    convenience init(_ label: String) {
        self.init(label, type: .binaryOp)
    }
    override func action(n1: String, n2: String?) -> String {
        guard let x = Decimal(string: n1) else {
            fatalError("\(n1) is not a number")
        }
        guard let n = n2, let y = Decimal(string: n) else {
            fatalError("\(n2 ?? "N/A") is not a number")
        }
        
        switch label {
        case K.Operator.Plus.label:
            return format(x + y)
        case K.Operator.Minus.label:
            return format(x - y)
        case K.Operator.Times.label:
            return format(x * y)
        default:
            return format(x / y)
        }
    }
}


