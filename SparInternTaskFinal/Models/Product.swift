import Foundation

struct Badge: Codable {
    let text: String
    let textColor: String
    let backgroundColor: String
}

struct Product: Codable {
    let id: String
    let name: String
    let description: String?
    let imageURL: String?
    let price: Float
    let oldPrice: Float?
    let discount: String?
    let badge: Badge?
    let rating: Float?
}
