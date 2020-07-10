import Foundation

class Calculator {
    var num1: String? = nil
    var num2: String? = nil
    var op: CalculatorButton? = nil
    
    func calculate(button: CalculatorButton, n: String) -> String {
        guard let _ = Float(n) else {
            fatalError("'\(n)' must be a number")
        }
        
        if button.type == .num {
            let btn = button as! NumberButton
            if op == nil {
                num1 = btn.action(n1: num1 ?? K.Number.Zero.label, n2: nil)
            } else {
                num2 = btn.action(n1: num2 ?? K.Number.Zero.label, n2: nil)
                return num2!
            }
        } else {
            num1 = num1 ?? n
            let x = num1!
            switch button.type {
            case .unaryOp:
                let btn = button as! UnaryOperatorButton
                num1 = btn.action(n1: x, n2: nil)
            case .binaryOp:
                op = button
            case .eq:
                if let o = op, let y = num2 {
                    num1 = o.action(n1: x, n2: y)
                    num2 = nil
                    op = nil
                }
            default:
                num1 = K.Number.Zero.label
                num2 = nil
                op = nil
            }
        }
        return num1!
    }
}
