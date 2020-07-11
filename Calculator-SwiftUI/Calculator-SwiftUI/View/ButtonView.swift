import SwiftUI

struct ButtonView: View {
    let button: CalculatorButton
    let calc: Calculator
    
    var body: some View {
        Button(action: {
            self.calc.button = self.button
        }) {
            TextView(label: self.button.label)
        }
        .background(self.button.color)
    }
}

extension CalculatorButton {
    var color: Color {
        switch type {
        case .clear, .unaryOp:
            return Color(K.Color.GrayButton)
        case .binaryOp, .eq:
            return Color(K.Color.OrangeButton)
        default:
            return Color(K.Color.BlueButton)
        }
    }
}
