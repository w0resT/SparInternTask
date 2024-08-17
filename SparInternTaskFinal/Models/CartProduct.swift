import RealmSwift

class CartProductBadge: EmbeddedObject {
    @Persisted var text: String
    @Persisted var textColor: String
    @Persisted var backgroundColor: String
}

class CartProduct: Object {
    @Persisted(primaryKey: true) var id: String
    @Persisted var name: String
    @Persisted var descriptionText: String?
    @Persisted var imageURL: String?
    @Persisted var price: Float
    @Persisted var oldPrice: Float?
    @Persisted var discount: String?
    @Persisted var badge: CartProductBadge?
    @Persisted var rating: Float?
    @Persisted var quantity: Int
}
