import Foundation

var width: Float = 1.5
var height: Float = 2.3
let bucketCapacity: Float = 1.5

var buckets: Int {
    get {
        return Int(ceil((width * height) / bucketCapacity))
    }
    set {
        let area = Float(newValue) * 1.5
        print("\(newValue) buckets can paint an area \(area) sqm.")
    }
}

print(buckets)
buckets = 8
