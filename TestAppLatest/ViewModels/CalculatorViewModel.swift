import SwiftUI
import Combine

class CalculatorViewModel: ObservableObject {
    @Published var display = "0"
    @Published var history: [HistoryItem] = []
    
    private var currentNumber: Double = 0
    private var previousNumber: Double = 0
    private var operation: CalculatorButton?
    private var isTypingNumber = false
    
    func buttonTapped(_ button: CalculatorButton) {
        switch button {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            if isTypingNumber {
                if display.count < 9 {
                    display = display == "0" ? button.rawValue : display + button.rawValue
                }
            } else {
                display = button.rawValue
                isTypingNumber = true
            }
            
        case .decimal:
            if isTypingNumber {
                if !display.contains(".") && display.count < 8 {
                    display += "."
                }
            } else {
                display = "0."
                isTypingNumber = true
            }
            
        case .clear:
            display = "0"
            currentNumber = 0
            previousNumber = 0
            operation = nil
            isTypingNumber = false
            
        case .negative:
            if let value = Double(display) {
                currentNumber = -value
                display = formatNumber(currentNumber)
            }
            
        case .percent:
            if let value = Double(display) {
                currentNumber = value / 100
                display = formatNumber(currentNumber)
            }
            
        case .add, .subtract, .multiply, .divide:
            if let value = Double(display) {
                if isTypingNumber {
                    if let prevOp = operation {
                        previousNumber = performOperation(prevOp, previousNumber, value)
                        display = formatNumber(previousNumber)
                    } else {
                        previousNumber = value
                    }
                }
                operation = button
                isTypingNumber = false
            }
            
        case .equal:
            if let value = Double(display), let op = operation {
                let prev = previousNumber
                currentNumber = performOperation(op, previousNumber, value)
                let resultStr = formatNumber(currentNumber)
                let expression = "\(formatNumber(prev)) \(op.rawValue) \(formatNumber(value)) = \(resultStr)"
                history.append(HistoryItem(expression: expression, result: resultStr))
                display = resultStr
                operation = nil
                isTypingNumber = false
                previousNumber = currentNumber
            }
        }
    }
    
    func loadResult(_ item: HistoryItem) {
        display = item.result
        if let value = Double(item.result) {
            currentNumber = value
            previousNumber = value
        }
        operation = nil
        isTypingNumber = false
    }
    
    private func performOperation(_ operation: CalculatorButton, _ num1: Double, _ num2: Double) -> Double {
        switch operation {
        case .add:
            return num1 + num2
        case .subtract:
            return num1 - num2
        case .multiply:
            return num1 * num2
        case .divide:
            return num2 != 0 ? num1 / num2 : 0
        default:
            return num2
        }
    }
    
    private func formatNumber(_ number: Double) -> String {
        if number == 0 {
            return "0"
        }
        if number.truncatingRemainder(dividingBy: 1) == 0 && abs(number) < 1_000_000_000 {
            return String(format: "%.0f", number)
        } else {
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 0
            formatter.maximumFractionDigits = 6
            formatter.numberStyle = .decimal
            formatter.locale = Locale(identifier: "en_US_POSIX")
            return formatter.string(from: NSNumber(value: number)) ?? "0"
        }
    }
}
