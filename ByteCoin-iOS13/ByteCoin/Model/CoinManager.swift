import Foundation

protocol CoinManagerDelegate {
    func didFetchCurrencies(_ currencies: [Currency])
    func didGetPrice(_ bpi: BPI)
}
struct CoinManager {
    let baseURL = "https://api.coindesk.com/v1/bpi"
    var delegate: CoinManagerDelegate?
    
    func fetchCurrencies() -> Void {
        if let url = URL(string: "\(baseURL)/supported-currencies.json") {
            exchange(url, callback: delegate!.didFetchCurrencies)
        }
    }
    
    func getPrice(for symbol: String) -> Void {
        if let url = URL(string: "\(baseURL)/currentprice/\(symbol).json") {
            let callback: (Prices) -> Void = { prices in self.delegate!.didGetPrice(prices.bpi[symbol]!) }
            exchange(url, callback: callback)
        }
    }
    
    func exchange<T: Decodable>(_ url: URL, callback: @escaping (T) -> Void) -> Void {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if let safeData = data, error == nil {
                callback(self.parseJSON(safeData, typ: T.self))
            } else {
               print(error)
               fatalError("Couldn't get price")
           }
        }
        task.resume()
    }
    
    func parseJSON<T: Decodable>(_ data: Data, typ: T.Type) -> T {
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(typ, from: data)
        } catch {
            print(error)
            fatalError("Couldn't parse currencies")
        }
    }
}
