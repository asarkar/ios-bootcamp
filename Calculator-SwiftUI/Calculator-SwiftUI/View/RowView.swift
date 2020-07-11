import SwiftUI

struct RowView: View {
    let buttons: [CalculatorButton]
    let calc: Calculator
    
    var body: some View {
        createCells(self.buttons)
    }
    
    private func createCells(_ buttons: [CalculatorButton]) -> some View {
        if buttons.count % 2 == 0 {
            return AnyView(HStack(spacing: 1) {
                ForEach(buttons, id: \.label) { button in
                    ButtonView(button: button, calc: self.calc)
                }
            })
        } else {
            return AnyView(HStack(spacing: 1) {
                ButtonView(button: buttons[0], calc: self.calc)
                createCells(buttons.suffix(2))
            })
        }
    }
}
