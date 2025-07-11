//
//  Calculadora_TestesUITests.swift
//  Calculadora_TestesUITests
//
//  Created by Lucas Santos on 11/07/25.
//

import XCTest

final class SuperCalculatorUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    func testBasicAdditionUI() {
        app.buttons["1"].tap()
        app.buttons["+"].tap()
        app.buttons["2"].tap()
        app.buttons["="].tap()
        let result = app.staticTexts["displayLabel"].label
        XCTAssertEqual(result, "3")
    }

    func testDivisionByZeroUI() {
        app.buttons["5"].tap()
        app.buttons["/"].tap()
        app.buttons["0"].tap()
        app.buttons["="].tap()
        let result = app.staticTexts["displayLabel"].label
        XCTAssertEqual(result, "Error")
    }



    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
