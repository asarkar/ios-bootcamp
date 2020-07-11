import Foundation

extension Double {
    func isApproximatelyEqual(other: Double, precision: Int = 2) -> Bool {
        return self.roundedTo(precision) == other.roundedTo(precision)
    }
    
    func roundedTo(_ precision: Int) -> Double {
        let offset = pow(10, Double(precision))
        let x = (self * offset)
        let y = x.rounded()
        let result = y / offset
        return result
    }
}
