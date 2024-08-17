import SwiftUI

struct CatalogListRowView: View {
    @State var isFromCart = false
    @State private var isCartExpanded = false
    var product: ProductViewModel

    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            // MARK: - Top
            ZStack(alignment: .topLeading) {
                // Product image
                if let image = product.imageURL {
                    CellImageView(image: UIImage(named: image) ?? UIImage())
                }

                // Badge
                HStack(alignment: .top) {
                    // Badge
                    if let badge = product.badge {
                        CellBadgeView(text: badge.text,
                                      textColor: Color(hexString: badge.textColor),
                                      backgroundColor: Color(hexString: badge.backgroundColor)
                        )
                            .opacity(0.9)
                    }
                }

                // Discount
                VStack(alignment: .leading) {
                    Spacer()
                    HStack {
                        Spacer()
                        
                        if let discount = product.discount {
                            CellDiscountView(discount: String(discount))
                        }
                    }
                }
            }
            .frame(width: 144, height: 144)
            .cornerRadius(8)
            .padding([.top, .leading, .bottom], 16)
            .padding(.trailing, 4)

            // MARK: - Bottom
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .topLeading) {
                    // Actions
                    HStack(alignment: .top, spacing: 0) {
                        Spacer()
                        ActionsView(isFromCart: $isFromCart, product: product)
                    }

                    // Rating + Name + Description
                    VStack(alignment: .leading, spacing: 0) {
                        // Rating
                        HStack(alignment: .top, spacing: 0) {
                            if let rating = product.rating {
                                CellRatingView(rating: rating)
                                    .padding(.leading, 4)
                                    .padding(.top, 2)
                            }

                            // Change to Rate amount
                            if true {
                                Text("|")
                                    .font(.system(size: 14, weight: .light))
                                    .foregroundColor(.black.opacity(0.6))
                                    .padding(.horizontal, 2)

                                Text("19 отзывов")
                                    .font(.caption)
                                    .foregroundColor(.black.opacity(0.6))
                                    .padding(.top, 2.6)
                            }
                        }
                        .frame(height: 20)

                        // Name + Description
                        VStack(alignment: .leading, spacing: 4) {
                            // Product Name
                            CellNameView(name: product.name)

                            // Description
                            if let description = product.descriptionText {
                                CellDescriptionView(description: description)
                            }
                        }
                        .frame(maxWidth: 167, alignment: .leading)
                        .padding(.top, 4)
                    }
                }

                Spacer(minLength: 0)

                if isCartExpanded {
                    CellButtonSwitchView()
                        .padding(.bottom, 4)
                }

                // Price + ButtonAddToCart
                HStack(spacing: 0) {
                    if !isCartExpanded {
                        CellPriceView(price: product.price, oldPrice: product.oldPrice ?? 0)
                    }

                    Spacer(minLength: 0)

                    CellButtonCartView(isExpanded: $isCartExpanded, product: product)
                }
                .frame(height: 44)
            }
            .padding(.vertical, 16)
            .padding(.trailing, 8)
            .padding(.leading, 4)

            Spacer(minLength: 0)
        }
        .frame(height: 176)
    }
}

struct CatalogListRowView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogListRowView(product: ProductViewModel(id: "1", name: "Сыр Ламбер 500/0 230г Cheease Cool", description: "Описание ", imageURL: "pic2", price: 9999.99, oldPrice: 19000, discount: "25", badge: BadgeViewModel(text: "Удар по ценам", textColor: "#FFFFFF", backgroundColor: "#FC797D"), rating: 4.3))
    }
}
