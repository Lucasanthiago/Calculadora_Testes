//
//  Calculadora_TestesUITests.swift
//  Calculadora_TestesUITests
//
//  Created by Lucas Santos on 11/07/25.
//

import XCTest

/// UI tests interacting with the on-screen calculator
final class SuperCalculatorUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    /// Taps buttons to calculate 1 + 2 and checks if the display shows 3
    func testBasicAdditionUI() {
        app.buttons["1"].tap()
        app.buttons["+"]?.tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        let result = app.staticTexts["displayLabel"].label
        XCTAssertEqual(result, "3")
    }

    /// Ensures the UI presents "Error" when dividing by zero
    func testDivisionByZeroUI() {
        app.buttons["5"].tap()
        app.buttons["/"]?.tap()
        app.buttons["0"].tap()
        app.buttons["="]?.tap()
        let result = app.staticTexts["displayLabel"].label
        XCTAssertEqual(result, "Error")
    }

    /// Calculates 8 - 2 = 6 using the interface
    func testSubtractionUI() {
        app.buttons["8"].tap()
        app.buttons["-"]?.tap()
        app.buttons["2"].tap()
        app.buttons["="]?.tap()
        let result = app.staticTexts["displayLabel"].label
        XCTAssertEqual(result, "6")
    }

    /// Calculates 4 * 5 = 20 through taps
    func testMultiplicationUI() {
        app.buttons["4"].tap()
        app.buttons["*"]?.tap()
        app.buttons["5"].tap()
        app.buttons["="]?.tap()
        let result = app.staticTexts["displayLabel"].label
        XCTAssertEqual(result, "20")
    }

    /// Tests decimal input: 2.5 + 2.5 = 5
    func testDecimalAdditionUI() {
        app.buttons["2"].tap()
        app.buttons["."]?.tap()
        app.buttons["5"].tap()
        app.buttons["+"]?.tap()
        app.buttons["2"].tap()
        app.buttons["."]?.tap()
        app.buttons["5"].tap()
        app.buttons["="]?.tap()
        let result = app.staticTexts["displayLabel"].label
        XCTAssertEqual(result, "5")
    }

    /// Verifies that tapping C clears the display
    func testClearButtonUI() {
        app.buttons["9"].tap()
        app.buttons["C"].tap()
        let result = app.staticTexts["displayLabel"].label
        XCTAssertEqual(result, "0")
    }

    /// Performs 2 + 3 then * 4 and expects 20 on screen
    func testChainedOperationsUI() {
        app.buttons["2"].tap()
        app.buttons["+"]?.tap()
        app.buttons["3"].tap()
        app.buttons["*"]?.tap()
        app.buttons["4"].tap()
        app.buttons["="]?.tap()
        let result = app.staticTexts["displayLabel"].label
        XCTAssertEqual(result, "20")
    }
}
