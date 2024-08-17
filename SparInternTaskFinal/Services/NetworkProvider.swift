import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidData
    case badResponse
}

protocol NetworkProviderProtocol {
    func request<T: Decodable>(endpoint: URL, completion: @escaping(Result<T, Error>) -> Void)
}

class NetworkProvider: NetworkProviderProtocol {
    // MARK: - Properties
    private let session: URLSession

    // MARK: - Initializers
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    // MARK: - NetworkProviderProtocol
    func request<T>(endpoint: URL, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        let task = session.dataTask(with: endpoint) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(NetworkError.badResponse))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.invalidData))
                return
            }

            let result: Result<T, Error> = self.decode(data)
            completion(result)
        }
        task.resume()
    }

    // MARK: - Private Methods
    private func decode<T: Decodable>(_ data: Data) -> Result<T, Error> {
        do {
            let decodedObject = try JSONDecoder().decode(T.self, from: data)
            return .success(decodedObject)
        } catch {
            return .failure(error)
        }
    }
}
