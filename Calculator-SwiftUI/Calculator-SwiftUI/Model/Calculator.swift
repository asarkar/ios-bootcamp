import Foundation

class Calculator: ObservableObject {
    private var num1: String? = nil
    private var num2: String? = nil
    private var op: CalculatorButton? = nil
    @Published private(set) var result: String = K.Number.Zero.label
    
    var button: CalculatorButton? {
        willSet {
            guard let btn = newValue else {
                return
            }
            if btn.type == .num {
                if op == nil {
                    num1 = btn.action(n1: num1 ?? K.Number.Zero.label, n2: nil)
                } else {
                    num2 = btn.action(n1: num2 ?? K.Number.Zero.label, n2: nil)
                    result = num2!
                    return
                }
            } else {
                num1 = num1 ?? result
                let x = num1!
                switch btn.type {
                case .unaryOp:
                    num1 = btn.action(n1: x, n2: nil)
                case .binaryOp:
                    op = btn
                case .eq:
                    if let o = op, let y = num2 {
                        num1 = o.action(n1: x, n2: y)
                    }
                default:
                    num1 = K.Number.Zero.label
                }
                
                num2 = nil
                if btn.type != .binaryOp {
                    op = nil
                }
            }
            result = num1!
        }
    }
}
