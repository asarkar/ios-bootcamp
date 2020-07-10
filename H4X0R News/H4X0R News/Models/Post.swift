import Foundation
struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case points, title, url
        case id = "objectID"
    }
    
    let id: String
    let points: Int
    let title: String
    let url: String?
}
