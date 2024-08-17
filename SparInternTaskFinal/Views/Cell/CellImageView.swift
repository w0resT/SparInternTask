import SwiftUI

struct CellImageView: View {
    var image: UIImage

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct CellImageView_Previews: PreviewProvider {
    static var previews: some View {
        CellImageView(image: UIImage(named: "pic2") ?? UIImage())
    }
}
