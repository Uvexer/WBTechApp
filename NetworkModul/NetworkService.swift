import Foundation

public class NetworkService {
    public static let shared = NetworkService()

    private init() {}

    public func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "users", withExtension: "json") else {
            completion(.failure(NetworkError.invalidURL))
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let users = try JSONDecoder().decode([User].self, from: data)
            completion(.success(users))
        } catch {
            completion(.failure(error))
        }
    }
}

public enum NetworkError: Error {
    case invalidURL
    case noData
}

