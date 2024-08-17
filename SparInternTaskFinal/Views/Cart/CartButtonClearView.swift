import SwiftUI

struct CartButtonClearView: View {
    @ObservedObject var cartViewModel: CartViewModel

    var body: some View {
        Button {
            cartViewModel.clearCart()
        } label: {
            Text(L10n.cartClear)
                .frame(maxWidth: .infinity)
                .frame(height: 58)
                .background(.clear)
                .foregroundColor(Color(uiColor: UIColor(named: "buttonColor") ?? .green))
                .bold()
                .overlay(
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(Color(uiColor: UIColor(named: "buttonColor") ?? .green), lineWidth: 4)
                )
                .padding(.horizontal, 48)
                .padding(.vertical, 24)
        }
    }
}

struct CartButtonClearView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonClearView(cartViewModel: CartViewModel())
    }
}
