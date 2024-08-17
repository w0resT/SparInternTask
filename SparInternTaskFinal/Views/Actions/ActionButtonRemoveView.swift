import SwiftUI

struct ActionButtonRemoveView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    var product: ProductViewModel
    
    var body: some View {
        Button {
            cartViewModel.removeFromCart(productId: product.id, forceRemove: true)
        } label: {
            Image(systemName: "trash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.red)
                .frame(width: 16, height: 16)
        }
        .frame(width: 32, height: 32)
    }
}

struct ActionButtonRemoveView_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonRemoveView(product: ProductViewModel(id: "1", name: "Сыр Ламбер 500/0 230г Cheease", description: "Описание ", imageURL: "pic2", price: 9999.99, oldPrice: 19000, discount: "25", badge: BadgeViewModel(text: "Удар по ценам", textColor: "#FFFFFF", backgroundColor: "#FC797D"), rating: 4.3))
    }
}
