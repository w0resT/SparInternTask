import Foundation
import RealmSwift

class CartViewModel: ObservableObject {
    // MARK: - Properties
    @Published var dataSource: [CartProduct] = []

    private let databaseService: LocalDatabaseServiceProtocol
    private var notificationToken: NotificationToken?

    // MARK: - Initializers & Deinitializer
    init(databaseService: LocalDatabaseServiceProtocol = LocalDatabaseService()) {
        self.databaseService = databaseService
        observeCartChanges()
    }

    deinit {
        notificationToken?.invalidate()
    }

    // MARK: - Public Methods
    func fetchProducts() {
        dataSource = databaseService.fetchProductsFromCart()
    }

    func addToCart(product: ProductViewModel, quantity: Int = 1) {
        databaseService.addProductToCart(product, quantity: quantity)
    }

    func removeFromCart(productId: String, forceRemove: Bool = false) {
        databaseService.removeProductFromCart(by: productId, force: forceRemove)
    }

    func clearCart() {
        databaseService.clearCart()
    }

    func transformToCatalogList() -> CatalogList {
        return CatalogList(cart: dataSource)
    }
    
    // MARK: - Private Methods
    private func observeCartChanges() {
        guard let realm = databaseService.getRealm() else {
            return
        }

        let cartProducts = realm.objects(CartProduct.self)
        notificationToken = cartProducts.observe { [weak self] changes in
                    switch changes {
                    case .initial(let initialResults):
                        self?.dataSource = Array(initialResults)
                    case .update(let updatedResults, _, _, _):
                        self?.dataSource = Array(updatedResults)
                    case .error(let error):
                        print("error observing cart changes: \(error)")
                    }
                }
    }
}
