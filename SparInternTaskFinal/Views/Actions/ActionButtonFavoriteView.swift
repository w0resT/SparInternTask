import SwiftUI

struct ActionButtonFavoriteView: View {
    var body: some View {
        Button {
            print("buttonAddFavorite click")
        } label: {
            Image(systemName: "heart")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray)
                .frame(width: 16, height: 16)
        }
        .frame(width: 32, height: 32)
    }
}

struct ActionButtonFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonFavoriteView()
    }
}
