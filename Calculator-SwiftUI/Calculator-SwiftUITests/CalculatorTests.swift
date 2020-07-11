import XCTest
@testable import Calculator_SwiftUI

class CalculatorTests: XCTestCase {
    var calc: Calculator!
    
    override func setUpWithError() throws {
        super.setUp()
        calc = Calculator()
    }
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func testNegation() {
        calc.button = K.Operator.Not
        XCTAssertEqual(calc.result, "0")
        calc.button = K.Operator.Not
        XCTAssertEqual(calc.result, "0")
    }
    
    func testPercentage() {
        calc.button = K.Number.Nine
        calc.button = K.Operator.Percent
        XCTAssertEqual(calc.result, "0.09")
    }
    
    func testAddition() {
        calc.button = K.Number.One
        XCTAssertEqual(calc.result, "1")
        calc.button = K.Number.Two
        XCTAssertEqual(calc.result, "12")
        calc.button = K.Operator.Plus
        XCTAssertEqual(calc.result, "12")
        calc.button = K.Number.Eight
        XCTAssertEqual(calc.result, "8")
        calc.button = K.Equals
        XCTAssertEqual(calc.result, "20")
    }
    
    func testSubtraction() {
        calc.button = K.Number.One
        XCTAssertEqual(calc.result, "1")
        calc.button = K.Number.Two
        XCTAssertEqual(calc.result, "12")
        calc.button = K.Operator.Minus
        XCTAssertEqual(calc.result, "12")
        calc.button = K.Number.Eight
        XCTAssertEqual(calc.result, "8")
        calc.button = K.Equals
        XCTAssertEqual(calc.result, "4")
    }
    
    func testMultiplication() {
        calc.button = K.Number.One
        XCTAssertEqual(calc.result, "1")
        calc.button = K.Number.Two
        XCTAssertEqual(calc.result, "12")
        calc.button = K.Operator.Times
        XCTAssertEqual(calc.result, "12")
        calc.button = K.Number.Three
        XCTAssertEqual(calc.result, "3")
        calc.button = K.Equals
        XCTAssertEqual(calc.result, "36")
    }
    
    func testDivision() {
        calc.button = K.Number.One
        XCTAssertEqual(calc.result, "1")
        calc.button = K.Number.Two
        XCTAssertEqual(calc.result, "12")
        calc.button = K.Operator.Division
        XCTAssertEqual(calc.result, "12")
        calc.button = K.Number.Five
        XCTAssertEqual(calc.result, "5")
        calc.button = K.Equals
        XCTAssertEqual(calc.result, "2.4")
    }
    
    func testAddDecimals() {
        calc.button = K.Number.One
        XCTAssertEqual(calc.result, "1")
        calc.button = K.Number.Decimal
        XCTAssertEqual(calc.result, "1.")
        calc.button = K.Number.Two
        XCTAssertEqual(calc.result, "1.2")
        calc.button = K.Operator.Plus
        XCTAssertEqual(calc.result, "1.2")
        calc.button = K.Number.Two
        XCTAssertEqual(calc.result, "2")
        calc.button = K.Equals
        XCTAssertEqual(calc.result, "3.2")
    }
    
    func testSubtractDecimals() {
        calc.button = K.Number.Seven
        XCTAssertEqual(calc.result, "7")
        calc.button = K.Number.Eight
        XCTAssertEqual(calc.result, "78")
        calc.button = K.Number.Decimal
        XCTAssertEqual(calc.result, "78.")
        calc.button = K.Number.Nine
        XCTAssertEqual(calc.result, "78.9")
        calc.button = K.Operator.Minus
        XCTAssertEqual(calc.result, "78.9")
        calc.button = K.Number.Six
        XCTAssertEqual(calc.result, "6")
        calc.button = K.Number.Five
        XCTAssertEqual(calc.result, "65")
        calc.button = K.Equals
        XCTAssertEqual(calc.result, "13.9")
    }
    
    func testLimit() {
        for i in 1...10 {
            calc.button = K.Number.Seven
            XCTAssertEqual(calc.result, String(repeating: "7", count: i))
        }
    }
    
    func testRounding() {
        for _ in 1...10 {
            calc.button = K.Number.Eight
        }
        calc.button = K.Operator.Plus
        calc.button = K.Number.Six
        calc.button = K.Number.Five
        calc.button = K.Equals
        
        XCTAssertEqual(calc.result, "8888888953")
    }
}
