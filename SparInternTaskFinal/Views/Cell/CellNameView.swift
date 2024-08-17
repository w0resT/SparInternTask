import SwiftUI

struct CellNameView: View {
    var name: String

    var body: some View {
        Text(name)
            .font(.caption)
            .foregroundColor(.black)
            .padding(.horizontal, 8)
            .lineLimit(2)
    }
}

struct CellNameView_Previews: PreviewProvider {
    static var previews: some View {
        CellNameView(name: "Сыр Ламбер 500/0 230г")
    }
}
