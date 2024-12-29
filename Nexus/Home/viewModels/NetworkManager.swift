import Foundation

// Network Manager responsible for making API requests
class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {} // Singleton pattern for a single instance
    
    func fetchData<T: Decodable>(from url: URL, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "Invalid Data", code: 1001, userInfo: nil)))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

import Foundation

class ProductService {
    private let networkManager = NetworkManager.shared 

    // Fetch products from Fake Store API
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        guard let url = URL(string: "https://fakestoreapi.com/products") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 1002, userInfo: nil)))
            return
        }
        
        networkManager.fetchData(from: url, responseType: [Product].self) { result in
            switch result {
            case .success(let products):
                completion(.success(products))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
