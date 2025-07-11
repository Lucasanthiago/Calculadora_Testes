//
//  Calculadora_TestesTests.swift
//  Calculadora_TestesTests
//
//  Created by Lucas Santos on 11/07/25.
//

import XCTest
@testable import Calculadora_Testes


final class SuperCalculatorTests: XCTestCase {
    var calculator: CalculatorLogic!

    override func setUpWithError() throws {
        calculator = CalculatorLogic()
    }

    func testAddition() {
        calculator.setDigit("2")
        calculator.setOperation(.add)
        calculator.setDigit("3")
        calculator.equals()
        XCTAssertEqual(calculator.displayValue, "5")
    }

    func testDivisionByZero() {
        calculator.setDigit("5")
        calculator.setOperation(.divide)
        calculator.setDigit("0")
        calculator.equals()
        XCTAssertEqual(calculator.displayValue, "Error")
    }

    // Adicione outros testes se quiser!
}
