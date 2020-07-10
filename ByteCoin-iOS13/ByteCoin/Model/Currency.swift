import Foundation

struct Currency: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "country"
        case symbol = "currency"
    }
    
    let name: String
    let symbol: String
}
