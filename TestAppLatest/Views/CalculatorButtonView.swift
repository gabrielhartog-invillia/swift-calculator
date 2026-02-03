import SwiftUI

struct CalculatorButtonView: View {
    let button: CalculatorButton
    @ObservedObject var viewModel: CalculatorViewModel
    
    private let buttonSize: CGFloat = 80
    
    var body: some View {
        Button(action: {
            viewModel.buttonTapped(button)
        }) {
            Text(button.rawValue)
                .font(.system(size: 35, weight: .medium))
                .foregroundColor(button.textColor)
                .frame(
                    width: button == .zero ? buttonSize * 2 + 12 : buttonSize,
                    height: buttonSize
                )
                .background(button.buttonColor)
                .cornerRadius(buttonSize / 2)
        }
    }
}
