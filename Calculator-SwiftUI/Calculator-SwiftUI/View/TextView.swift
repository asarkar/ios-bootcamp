import SwiftUI

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
