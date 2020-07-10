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
        var result = calc.calculate(button: K.Operator.Not, n: K.Number.Zero.label)
        XCTAssertEqual(result, "0")
        result = calc.calculate(button: K.Operator.Not, n: result)
        XCTAssertEqual(result, "0")
    }
    
    func testPercentage() {
        let result = calc.calculate(button: K.Operator.Percent, n: K.Number.Nine.label)
        XCTAssertEqual(result, "0.09")
    }
    
    func testAddition() {
        var result = calc.calculate(button: K.Number.One, n: K.Number.Zero.label)
        XCTAssertEqual(result, "1")
        result = calc.calculate(button: K.Number.Two, n: result)
        XCTAssertEqual(result, "12")
        result = calc.calculate(button: K.Operator.Plus, n: result)
        XCTAssertEqual(result, "12")
        result = calc.calculate(button: K.Number.Eight, n: result)
        XCTAssertEqual(result, "8")
        result = calc.calculate(button: K.Equals, n: result)
        XCTAssertEqual(result, "20")
    }
    
    func testSubtraction() {
        var result = calc.calculate(button: K.Number.One, n: K.Number.Zero.label)
        XCTAssertEqual(result, "1")
        result = calc.calculate(button: K.Number.Two, n: result)
        XCTAssertEqual(result, "12")
        result = calc.calculate(button: K.Operator.Minus, n: result)
        XCTAssertEqual(result, "12")
        result = calc.calculate(button: K.Number.Eight, n: result)
        XCTAssertEqual(result, "8")
        result = calc.calculate(button: K.Equals, n: result)
        XCTAssertEqual(result, "4")
    }
    
    func testMultiplication() {
        var result = calc.calculate(button: K.Number.One, n: K.Number.Zero.label)
        XCTAssertEqual(result, "1")
        result = calc.calculate(button: K.Number.Two, n: result)
        XCTAssertEqual(result, "12")
        result = calc.calculate(button: K.Operator.Times, n: result)
        XCTAssertEqual(result, "12")
        result = calc.calculate(button: K.Number.Three, n: result)
        XCTAssertEqual(result, "3")
        result = calc.calculate(button: K.Equals, n: result)
        XCTAssertEqual(result, "36")
    }
    
    func testDivision() {
        var result = calc.calculate(button: K.Number.One, n: K.Number.Zero.label)
        XCTAssertEqual(result, "1")
        result = calc.calculate(button: K.Number.Two, n: result)
        XCTAssertEqual(result, "12")
        result = calc.calculate(button: K.Operator.Division, n: result)
        XCTAssertEqual(result, "12")
        result = calc.calculate(button: K.Number.Five, n: result)
        XCTAssertEqual(result, "5")
        result = calc.calculate(button: K.Equals, n: result)
        XCTAssertEqual(result, "2.4")
    }
    
    func testAddDecimals() {
        var result = calc.calculate(button: K.Number.One, n: K.Number.Zero.label)
        XCTAssertEqual(result, "1")
        result = calc.calculate(button: K.Number.Decimal, n: result)
        XCTAssertEqual(result, "1.")
        result = calc.calculate(button: K.Number.Two, n: result)
        XCTAssertEqual(result, "1.2")
        result = calc.calculate(button: K.Operator.Plus, n: result)
        XCTAssertEqual(result, "1.2")
        result = calc.calculate(button: K.Number.Two, n: result)
        XCTAssertEqual(result, "2")
        result = calc.calculate(button: K.Equals, n: result)
        XCTAssertEqual(result, "3.2")
    }
}
