import Foundation

struct CatalogList {
    var products: [ProductViewModel]

    // Init via NetworkService
    init(response: ProductsResponse) {
        products = response.products.map { ProductViewModel(response: $0) }
    }

    // Init via DatabaseService
    init(cart: [CartProduct]) {
        products = cart.map { ProductViewModel(cart: $0) }
    }

    init() {
        products = [ProductViewModel]()
    }
}
