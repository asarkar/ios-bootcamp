import Foundation

struct Prices: Decodable {
    let bpi: [String: BPI]
}
struct BPI: Decodable {
    enum CodingKeys: String, CodingKey {
        case symbol = "code"
        case rate = "rate_float"
    }
    let rate: Float
    let symbol: String
}
