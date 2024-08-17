import SwiftUI

struct ActionsView: View {
    @Binding var isFromCart: Bool
    var product: ProductViewModel

    var body: some View {
        VStack(spacing: 0) {
            // if called through the cart
            // then isFromCart true, otherwise false
            if isFromCart {
                ActionButtonRemoveView(product: product)
            } else {
                ActionButtonOrderView()
                ActionButtonFavoriteView()
            }
        }
        .frame(width: 32, height: 64)
        .background(.white.opacity(0.8))
        .cornerRadius(16)
    }
}

struct ActionsView_Previews: PreviewProvider {
    static var previews: some View {
        ActionsView(isFromCart: .constant(false), product: ProductViewModel(id: "1", name: "Сыр Ламбер 500/0 230г Cheease", description: "Описание ", imageURL: "pic2", price: 9999.99, oldPrice: 19000, discount: "25", badge: BadgeViewModel(text: "Удар по ценам", textColor: "#FFFFFF", backgroundColor: "#FC797D"), rating: 4.3))
    }
}
