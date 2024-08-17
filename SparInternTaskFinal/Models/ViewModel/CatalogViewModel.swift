import Foundation

class CatalogViewModel: ObservableObject {
    // MARK: - Properties
    @Published var dataSource = CatalogList()
    @Published var isLoading = false
    
    private let networkService: NetworkServiceProtocol
    private let endpoint = "https://mp4a00b277a54380b059.free.beeceptor.com/products"

    // MARK: - Initializers
    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    // MARK: - Public Methods
    func updateCatalog() {
/// Set 'false' to parse data from network
#if true
        dataSource = CatalogList(response: ResponseMock().response)
#else
        isLoading = true
        networkService.fetchProducts(urlString: endpoint) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let products):
                    self?.dataSource = CatalogList(response: products)
                case .failure(let error):
                    print("\(#function): \(error)")
                }
            }
        }
#endif
    }
}
