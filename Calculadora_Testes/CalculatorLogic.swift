//
//  CalculatorLogic.swift
//  Calculadora_Testes
//
//  Created by Lucas Santos on 11/07/25.
//


import Foundation

class CalculatorLogic: ObservableObject {
    @Published var displayValue: String = "0"
    private var currentNumber: Double?
    private var previousNumber: Double?
    private var currentOperation: Operation?
    private var awaitingNewNumber = true

    enum Operation {
        case add, subtract, multiply, divide, equals, none
    }

    func setDigit(_ digit: String) {
        if awaitingNewNumber {
            displayValue = digit
            awaitingNewNumber = false
        } else {
            if displayValue == "0" && digit == "0" { return }
            if digit == "." && displayValue.contains(".") { return }
            displayValue += digit
        }
        currentNumber = Double(displayValue)
    }

    func setOperation(_ operation: Operation) {
        if let currentNum = currentNumber {
            if previousNumber == nil || currentOperation == .equals || currentOperation == .none {
                previousNumber = currentNum
            } else {
                performCalculation()
                previousNumber = Double(displayValue)
            }
        }
        currentOperation = operation
        awaitingNewNumber = true
    }

    func equals() {
        performCalculation()
        currentOperation = .equals
        awaitingNewNumber = true
    }

    func clear() {
        displayValue = "0"
        currentNumber = nil
        previousNumber = nil
        currentOperation = .none
        awaitingNewNumber = true
    }

    private func performCalculation() {
        guard let prevNum = previousNumber, let currentNum = currentNumber, let operation = currentOperation else {
            return
        }
        var result: Double?
        switch operation {
        case .add: result = prevNum + currentNum
        case .subtract: result = prevNum - currentNum
        case .multiply: result = prevNum * currentNum
        case .divide:
            if currentNum != 0 {
                result = prevNum / currentNum
            } else {
                displayValue = "Error"
                previousNumber = nil
                currentNumber = nil
                currentOperation = .none
                return
            }
        case .equals, .none: return
        }
        if let finalResult = result {
            displayValue = (floor(finalResult) == finalResult) ?
                String(Int(finalResult)) : String(finalResult)
            previousNumber = finalResult
            currentNumber = finalResult
        }
    }
}
