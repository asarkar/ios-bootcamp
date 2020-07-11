import SwiftUI

struct ContentView: View {
    @ObservedObject var calc = Calculator()
    
    var body: some View {
        VStack(spacing: 1, content: {
            HStack {
                TextView(label: calc.result, size: 50, alignment: .trailing, horzPadding: 10)
            }
            .background(Color(K.Color.Panel))
            RowView(buttons: [K.Clear, K.Operator.Not, K.Operator.Percent, K.Operator.Division], calc: calc)
            RowView(buttons: [K.Number.Seven, K.Number.Eight, K.Number.Nine, K.Operator.Times], calc: calc)
            RowView(buttons: [K.Number.Four, K.Number.Five, K.Number.Six, K.Operator.Minus], calc: calc)
            RowView(buttons: [K.Number.One, K.Number.Two, K.Number.Three, K.Operator.Plus], calc: calc)
            RowView(buttons: [K.Number.Zero, K.Number.Decimal, K.Equals], calc: calc)
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
