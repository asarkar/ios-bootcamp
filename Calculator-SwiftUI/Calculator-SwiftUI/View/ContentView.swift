import SwiftUI

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

struct ContentView: View {
    @State private var result = K.Number.Zero.label
    private let calc = Calculator()
    
    var body: some View {
        VStack(spacing: 1, content: {
            HStack {
                TextView(label: self.result, size: 50, alignment: .trailing, horzPadding: 10)
            }
            .background(Color(K.Color.Panel))
            RowView(buttons: [K.Clear, K.Operator.Not, K.Operator.Percent, K.Operator.Division], result: $result, calc: calc)
            RowView(buttons: [K.Number.Seven, K.Number.Eight, K.Number.Nine, K.Operator.Times], result: $result, calc: calc)
            RowView(buttons: [K.Number.Four, K.Number.Five, K.Number.Six, K.Operator.Minus], result: $result, calc: calc)
            RowView(buttons: [K.Number.One, K.Number.Two, K.Number.Three, K.Operator.Plus], result: $result, calc: calc)
            RowView(buttons: [K.Number.Zero, K.Number.Decimal, K.Equals], result: $result, calc: calc)
        })
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct RowView: View {
    let buttons: [CalculatorButton]
    @Binding var result: String
    let calc: Calculator
    
    var body: some View {
        createCells(self.buttons)
    }
    
    private func createCells(_ buttons: [CalculatorButton]) -> some View {
        if buttons.count % 2 == 0 {
            return AnyView(HStack(spacing: 1) {
                ForEach(buttons, id: \.label) { button in
                    ButtonView(button: button, result: self.$result, calc: self.calc)
                }
            })
        } else {
            return AnyView(HStack(spacing: 1) {
                ButtonView(button: buttons[0], result: self.$result, calc: self.calc)
                createCells(buttons.suffix(2))
            })
        }
    }
}

struct ButtonView: View {
    let button: CalculatorButton
    @Binding var result: String
    let calc: Calculator
    
    var body: some View {
        Button(action: {
            self.result = self.calc.calculate(button: self.button, n: self.result)
        }) {
            TextView(label: self.button.label)
        }
        .background(self.button.color)
    }
}

struct TextView: View {
    let label: String
    var size: CGFloat = 30
    var alignment: Alignment = .center
    var horzPadding: CGFloat = .zero
    var body: some View {
        Text(label)
            .font(.system(size: self.size))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: self.alignment)
            .padding(EdgeInsets(top: 0, leading: horzPadding, bottom: 0, trailing: horzPadding))
    }
}
