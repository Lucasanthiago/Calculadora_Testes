//
//  Calculadora_TestesTests.swift
//  Calculadora_TestesTests
//
//  Created by Lucas Santos on 11/07/25.
//

import XCTest
@testable import Calculadora_Testes

/// Unit tests for `CalculatorLogic`
final class SuperCalculatorTests: XCTestCase {
    var calculator: CalculatorLogic!

    override func setUpWithError() throws {
        calculator = CalculatorLogic()
    }

    /// Verifies that a simple addition works (2 + 3 = 5)
    func testAddition() {
        calculator.setDigit("2")
        calculator.setOperation(.add)
        calculator.setDigit("3")
        calculator.equals()
        XCTAssertEqual(calculator.displayValue, "5")
    }

    /// Ensures dividing a number by zero shows an error
    func testDivisionByZero() {
        calculator.setDigit("5")
        calculator.setOperation(.divide)
        calculator.setDigit("0")
        calculator.equals()
        XCTAssertEqual(calculator.displayValue, "Error")
    }

    /// Checks subtraction producing a positive result (8 - 2 = 6)
    func testSubtraction() {
        calculator.setDigit("8")
        calculator.setOperation(.subtract)
        calculator.setDigit("2")
        calculator.equals()
        XCTAssertEqual(calculator.displayValue, "6")
    }

    /// Checks multiplication of two numbers (4 * 5 = 20)
    func testMultiplication() {
        calculator.setDigit("4")
        calculator.setOperation(.multiply)
        calculator.setDigit("5")
        calculator.equals()
        XCTAssertEqual(calculator.displayValue, "20")
    }

    /// Ensures decimal calculations are handled correctly (2.5 + 2.5 = 5)
    func testDecimalAddition() {
        calculator.setDigit("2")
        calculator.setDigit(".")
        calculator.setDigit("5")
        calculator.setOperation(.add)
        calculator.setDigit("2")
        calculator.setDigit(".")
        calculator.setDigit("5")
        calculator.equals()
        XCTAssertEqual(calculator.displayValue, "5")
    }

    /// Verifies that clearing resets the calculator to the initial state
    func testClearResetsState() {
        calculator.setDigit("9")
        calculator.setOperation(.multiply)
        calculator.setDigit("9")
        calculator.clear()
        XCTAssertEqual(calculator.displayValue, "0")
    }

    /// Tests multiple chained operations (2 + 3 then * 4 = 20)
    func testChainedOperations() {
        calculator.setDigit("2")
        calculator.setOperation(.add)
        calculator.setDigit("3")
        calculator.setOperation(.multiply)
        calculator.setDigit("4")
        calculator.equals()
        XCTAssertEqual(calculator.displayValue, "20")
    }
}
