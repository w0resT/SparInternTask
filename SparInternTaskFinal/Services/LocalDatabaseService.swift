import RealmSwift

protocol LocalDatabaseServiceProtocol {
    func getRealm() -> Realm?
    func fetchProductsFromCart() -> [CartProduct]
    func addProductToCart(_ product: ProductViewModel, quantity: Int)
    func removeProductFromCart(by id: String, force: Bool)
    func clearCart()
}

class LocalDatabaseService: LocalDatabaseServiceProtocol {
    // MARK: - Properties
    private var realm: Realm?

    // MARK: - Initializers
    init() {
        setupRealm()
    }

    // MARK: - LocalDatabaseServiceProtocol
    func getRealm() -> Realm? {
        return realm
    }

    func fetchProductsFromCart() -> [CartProduct] {
        guard let realm else { return [] }
        let cartProducts = realm.objects(CartProduct.self)
        return Array(cartProducts)
    }

    func addProductToCart(_ product: ProductViewModel, quantity: Int) {
        guard let realm else { return }
        realm.writeAsync {
            if let existingProduct = realm.object(ofType: CartProduct.self, forPrimaryKey: product.id) {
                existingProduct.quantity += quantity
            } else {
                let cartProduct = CartProduct()
                cartProduct.id = product.id
                cartProduct.name = product.name
                cartProduct.descriptionText = product.descriptionText
                cartProduct.imageURL = product.imageURL
                cartProduct.price = product.price
                cartProduct.oldPrice = product.oldPrice
                cartProduct.discount = product.discount
                cartProduct.rating = product.rating
                cartProduct.quantity = quantity
                cartProduct.badge = product.badge.map({ badgeViewModel in
                    let cartProductBadge = CartProductBadge()
                    cartProductBadge.text = badgeViewModel.text
                    cartProductBadge.textColor = badgeViewModel.textColor
                    cartProductBadge.backgroundColor = badgeViewModel.backgroundColor
                    return cartProductBadge
                })

                realm.add(cartProduct, update: .modified)
            }
        } onComplete: { error in
            if let error = error {
                print("\(#function) error: \(error)")
            }
        }
    }

    func removeProductFromCart(by id: String, force: Bool) {
        guard let realm else { return }
        realm.writeAsync {
            if let product = realm.object(ofType: CartProduct.self, forPrimaryKey: id) {
                if product.quantity > 1 && !force {
                    product.quantity -= 1
                } else {
                    realm.delete(product)
                }
            }
        } onComplete: { error in
            if let error = error {
                print("\(#function) error: \(error)")
            }
        }
    }

    func clearCart() {
        guard let realm else { return }
        realm.writeAsync {
            let cartProducts = realm.objects(CartProduct.self)
            realm.delete(cartProducts)
        } onComplete: { error in
            if let error = error {
                print("\(#function) error: \(error)")
            }
        }
    }
    
    // MARK: - Private Methods
    private func setupRealm() {
        do {
            let config = Realm.Configuration(inMemoryIdentifier: "inMemory")
            realm = try Realm(configuration: config)
        } catch let error {
            print("\(#function) error: \(error)")
        }
    }
}
