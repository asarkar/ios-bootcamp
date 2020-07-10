import Foundation

struct K {
    struct Number {
        static let Zero = NumberButton("0")
        static let One = NumberButton("1")
        static let Two = NumberButton("2")
        static let Three = NumberButton("3")
        static let Four = NumberButton("4")
        static let Five = NumberButton("5")
        static let Six = NumberButton("6")
        static let Seven = NumberButton("7")
        static let Eight = NumberButton("8")
        static let Nine = NumberButton("9")
        static let Decimal = NumberButton(".")
    }
    
    struct Operator {
        static let Plus = BinaryOperatorButton("+")
        static let Minus = BinaryOperatorButton("-")
        static let Times = BinaryOperatorButton("x")
        static let Division = BinaryOperatorButton("÷")
        static let Not = UnaryOperatorButton("±")
        static let Percent = UnaryOperatorButton("%")
    }
    
    struct Color {
        static let Panel = "CalculatorPanel"
        static let GrayButton = "CalculatorButton-Gray"
        static let BlueButton = "CalculatorButton-Blue"
        static let OrangeButton = "CalculatorButton-Orange"
    }
    
    static let Equals = EqualsButton("=")
    static let Clear = ClearButton("AC")
}
