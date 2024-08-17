import SwiftUI

struct CatalogGridCellView: View {
    @State private var isCartExpanded = false
    var product: ProductViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // MARK: - Top
            ZStack(alignment: .topLeading) {
                HStack(alignment: .center) {
                    Spacer(minLength: 0)
                    // Product image
                    if let image = product.imageURL {
                        CellImageView(image: UIImage(named: image) ?? UIImage())
                    }
                    Spacer(minLength: 0)
                }

                // Badge + Actions
                HStack(alignment: .top) {
                    // Badge
                    if let badge = product.badge {
                        CellBadgeView(text: badge.text,
                                      textColor: Color(hexString: badge.textColor),
                                      backgroundColor: Color(hexString: badge.backgroundColor))
                            .opacity(0.9)
                    }

                    Spacer()

                    // Actions List
                    ActionsView(isFromCart: .constant(false), product: product)
                }

                // Rating + Discount
                VStack(alignment: .leading) {
                    Spacer()
                    HStack {
                        if let rating = product.rating {
                            CellRatingView(rating: rating)
                        }

                        Spacer()

                        if let discount = product.discount {
                            CellDiscountView(discount: String(discount))
                        }
                    }
                }
            }
            .frame(width: 168, height: isCartExpanded ? 148 : 168)
            
            // MARK: - Bottom
            // Name + Description
            VStack(alignment: .leading, spacing: 4) {
                // Product Name
                CellNameView(name: product.name)
                
                // Description
                if let description = product.descriptionText {
                    CellDescriptionView(description: description)
                }
            }

            Spacer(minLength: 0)
            
            if isCartExpanded {
                CellButtonSwitchView()
            }

            // Price + ButtonAddToCart
            HStack(spacing: 0) {
                if !isCartExpanded {
                    CellPriceView(price: product.price, oldPrice: product.oldPrice ?? 0)
                }

                Spacer(minLength: 0)
                
                CellButtonCartView(isExpanded: $isCartExpanded, product: product)
            }
            .frame(width: 168, height: 44)
            .animation(.easeInOut(duration: 0.15), value: isCartExpanded)
        }
        .frame(width: 168, height: 278)
    }
}

struct CatalogGridCellView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogGridCellView(product: ProductViewModel(id: "1", name: "Сыр Ламбер 500/0 230г Cheease", description: "Описание ", imageURL: "pic2", price: 9999.99, oldPrice: 19000, discount: "25", badge: BadgeViewModel(text: "Удар по ценам", textColor: "#FFFFFF", backgroundColor: "#FC797D"), rating: 4.3))
    }
}
