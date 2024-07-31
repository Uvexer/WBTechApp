import Foundation

public struct User: Codable, Identifiable {
    public let id: Int
    public let name: String
    public let username: String
    public let email: String

    public init(id: Int, name: String, username: String, email: String) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
    }
}
