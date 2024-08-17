import Foundation

protocol NetworkServiceProtocol {
    func fetchProducts(urlString: String, completion: @escaping (Result<ProductsResponse, Error>) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    // MARK: - Properties
    private let provider: NetworkProviderProtocol

    // MARK: - Initializers
    init(provider: NetworkProviderProtocol = NetworkProvider()) {
        self.provider = provider
    }

    // MARK: - NetworkServiceProtocol
    func fetchProducts(urlString: String, completion: @escaping (Result<ProductsResponse, Error>) -> Void) {
        guard let currentUrl = URL(string: urlString) else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        provider.request(endpoint: currentUrl) { (result: Result<ProductsResponse, Error>) in
            switch result {
            case .success(let productsResponse):
                completion(.success(productsResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
