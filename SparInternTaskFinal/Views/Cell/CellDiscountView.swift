import SwiftUI

struct CellDiscountView: View {
    var discount: String

    var body: some View {
        Text(discount + "%")
            .font(.headline)
            .foregroundColor(Color(hue: 0, saturation: 0.82, brightness: 0.76))
            .fontWeight(.heavy)
            .padding(.trailing, 5)
    }
}

struct CellDiscountView_Previews: PreviewProvider {
    static var previews: some View {
        CellDiscountView(discount: "25")
    }
}
