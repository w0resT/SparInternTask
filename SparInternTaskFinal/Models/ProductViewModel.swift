import Foundation

struct BadgeViewModel {
    // Init via NetworkService
    init(badge: Badge) {
        text = badge.text
        textColor = badge.textColor
        backgroundColor = badge.backgroundColor
    }

    // Init via DatabaseService
    init(badge: CartProductBadge) {
        text = badge.text
        textColor = badge.textColor
        backgroundColor = badge.backgroundColor
    }

    init(text: String, textColor: String, backgroundColor: String) {
        self.text = text
        self.textColor = textColor
        self.backgroundColor = backgroundColor
    }

    let text: String
    let textColor: String
    let backgroundColor: String
}

struct ProductViewModel: Identifiable {
    let id: String
    let name: String
    let descriptionText: String?
    let imageURL: String?
    let price: Float
    let oldPrice: Float?
    let discount: String?
    let badge: BadgeViewModel?
    let rating: Float?

    init(id: String, name: String, description: String?,
         imageURL: String?, price: Float, oldPrice: Float?,
         discount: String?, badge: BadgeViewModel?, rating: Float?) {
        self.id = id
        self.name = name
        self.descriptionText = description
        self.imageURL = imageURL
        self.price = price
        self.oldPrice = oldPrice
        self.discount = discount
        self.badge = badge
        self.rating = rating
    }

    // Init via NetworkService
    init(response: Product) {
        self.id = response.id
        self.name = response.name
        self.descriptionText = response.description
        self.imageURL = response.imageURL
        self.price = response.price
        self.oldPrice = response.oldPrice
        self.discount = response.discount
        self.rating = response.rating
        self.badge = response.badge.map { BadgeViewModel(badge: $0) }
    }

    // Init via DatabaseService
    init(cart: CartProduct) {
        self.id = cart.id
        self.name = cart.name
        self.descriptionText = cart.description
        self.imageURL = cart.imageURL
        self.price = cart.price
        self.oldPrice = cart.oldPrice
        self.discount = cart.discount
        self.rating = cart.rating
        self.badge = cart.badge.map { BadgeViewModel(badge: $0) }
    }
}
