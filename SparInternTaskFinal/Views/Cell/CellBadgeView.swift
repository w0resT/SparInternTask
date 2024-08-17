import SwiftUI

struct CellBadgeView: View {
    var text: String
    var textColor: Color
    var backgroundColor: Color

    var body: some View {
        Text(text)
            .font(.system(size: 10))
            .foregroundColor(textColor)
            .padding(EdgeInsets(top: 2, leading: 12, bottom: 4, trailing: 6))
            .background(backgroundColor)
            .cornerRadius(5)
    }
}

struct CellBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        CellBadgeView(text: "Удар по ценам", textColor: .white, backgroundColor: .red)
    }
}
