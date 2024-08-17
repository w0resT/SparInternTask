import SwiftUI

struct ActionButtonOrderView: View {
    var body: some View {
        Button {
            print("buttonOrderList click")
        } label: {
            Image(uiImage: UIImage(named: "orderListIcon") ?? UIImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray)
                .frame(width: 16, height: 16)
        }
        .frame(width: 32, height: 32)
    }
}

struct ActionButtonOrderView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonOrderView()
    }
}
