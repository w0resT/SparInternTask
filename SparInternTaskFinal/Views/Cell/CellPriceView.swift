import SwiftUI

struct CellPriceView: View {
    var price: Float
    var oldPrice: Float

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(String(price) + " ₽/кг")
                .font(.system(size: 16))
                .bold()
                .padding(.leading, 8)

            if oldPrice != 0 {
                Text(String(oldPrice))
                    .font(.caption)
                    .strikethrough()
                    .foregroundColor(.gray)
                    .padding(.leading, 8)
            }
        }
    }
}

struct CellPriceView_Previews: PreviewProvider {
    static var previews: some View {
        CellPriceView(price: 199.99, oldPrice: 349.69)
    }
}
