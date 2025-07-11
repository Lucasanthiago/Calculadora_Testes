import SwiftUI

struct ContentView: View {
    @StateObject private var calculator = CalculatorLogic()
    let buttons = [
        ["7", "8", "9", "/"],
        ["4", "5", "6", "*"],
        ["1", "2", "3", "-"],
        ["0", ".", "=", "+"]
    ]

    var body: some View {
        VStack(spacing: 20) {
            Text(calculator.displayValue)
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding()
                .accessibilityIdentifier("displayLabel")

            ForEach(buttons, id: \.self) { row in
                HStack {
                    ForEach(row, id: \.self) { button in
                        Button(action: {
                            handleTap(button)
                        }) {
                            Text(button)
                                .font(.title)
                                .frame(width: 60, height: 60)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(30)
                        }
                        .accessibilityIdentifier(button)
                    }
                }
            }
            Button("C") {
                calculator.clear()
            }
            .font(.title)
            .frame(width: 60, height: 60)
            .background(Color.red.opacity(0.2))
            .cornerRadius(30)
            .accessibilityIdentifier("C")
        }
        .padding()
    }

    func handleTap(_ value: String) {
        switch value {
        case "0"..."9", ".":
            calculator.setDigit(value)
        case "+":
            calculator.setOperation(.add)
        case "-":
            calculator.setOperation(.subtract)
        case "*":
            calculator.setOperation(.multiply)
        case "/":
            calculator.setOperation(.divide)
        case "=":
            calculator.equals()
        default: break
        }
    }
}

#Preview {
    ContentView()
}
