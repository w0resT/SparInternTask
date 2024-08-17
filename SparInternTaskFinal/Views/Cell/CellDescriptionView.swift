import SwiftUI

struct CellDescriptionView: View {
    var description: String

    var body: some View {
        Text(description)
            .font(.caption)
            .foregroundColor(Color(hue: 0, saturation: 0, brightness: 0.15, opacity: 0.6))
            .padding(.horizontal, 8)
            .lineLimit(1)
    }
}

struct CellDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CellDescriptionView(description: "Франиция 2024")
    }
}
