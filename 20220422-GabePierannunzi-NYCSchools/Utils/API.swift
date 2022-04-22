
import Foundation

class API {
    
    enum FetchError: Error {
        case network
        case server
    }
    
    class func fetch<T: Decodable>(url: URL, type: T.Type) async throws -> T {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            return try decoder.decode(T.self, from: data)
        } catch {
            throw FetchError.network
        }
    }
    
}
