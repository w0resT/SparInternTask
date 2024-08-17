import SwiftUI

struct CellButtonCartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @Binding var isExpanded: Bool
    var product: ProductViewModel

    var body: some View {
        // If product is in the cart then isExpanded is true, otherwise it is false.
        Button {
            withAnimation(.easeInOut(duration: 0.15)) {
                if !isExpanded {
                    cartViewModel.addToCart(product: product)

                    isExpanded.toggle()
                }
            }
        } label: {
            if isExpanded {
                HStack {
                    Button {
                        cartViewModel.removeFromCart(productId: product.id)
                    } label: {
                        Image(systemName: "minus")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding(.horizontal, 8)

                    Spacer()

                    VStack(spacing: 0) {
                        if let quantity = cartViewModel.dataSource.first(where: {
                            $0.id == product.id
                            
                        })?.quantity {
                            Text("\(quantity) шт")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .bold))
                            Text("~\(quantity * 13) ₽")
                                .foregroundColor(.white.opacity(0.8))
                                .font(.caption)
                        }
                    }

                    Spacer()

                    Button {
                        cartViewModel.addToCart(product: product)
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .bold()
                    }
                    .padding(.horizontal, 8)
                }
            } else {
                Image(uiImage: UIImage(named: "cartIcon") ?? UIImage())
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: isExpanded ? .infinity : 48, maxHeight: 36)
        .background(Color(uiColor: UIColor(named: "buttonColor") ?? .green))
        .cornerRadius(isExpanded ? 40 : 20)
        .padding(.horizontal, 4)
        .animation(.easeInOut(duration: 0.15), value: isExpanded)
        .onAppear {
            withAnimation(.easeInOut(duration: 0.15)) {
                isExpanded = cartViewModel.dataSource.first(where: { $0.id == product.id }) != nil
            }
        }
        .onChange(of: cartViewModel.dataSource) { _ in
            withAnimation(.easeInOut(duration: 0.15)) {
                isExpanded = cartViewModel.dataSource.first(where: { $0.id == product.id }) != nil
            }
        }
    }
}

struct CellButtonCartView_Previews: PreviewProvider {
    static var previews: some View {
        CellButtonCartView(isExpanded: .constant(false), product: ProductViewModel(id: "1", name: "Сыр Ламбер 500/0 230г Cheease", description: "Описание ", imageURL: "pic2", price: 9999.99, oldPrice: 19000, discount: "25", badge: BadgeViewModel(text: "Удар по ценам", textColor: "#FFFFFF", backgroundColor: "#FC797D"), rating: 4.3))
    }
}
