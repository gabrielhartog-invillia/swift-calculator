import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CalculatorViewModel()
    @State private var showHistory = false
    
    let buttons: [[CalculatorButton]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                Spacer()
                
                // Display
                HStack {
                    Spacer()
                    Text(viewModel.display)
                        .font(.system(size: 80, weight: .light))
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        .padding(.horizontal, 28)
                }
                .padding(.bottom, 20)
                
                // Button Grid
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            CalculatorButtonView(button: button, viewModel: viewModel)
                        }
                    }
                }
                .padding(.bottom, 8)
                
                // History button
                Button("History") {
                    showHistory = true
                }
                .font(.system(size: 35, weight: .medium))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 80)
                .background(Color.orange)
                .cornerRadius(40)
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 20)
        }
        .fullScreenCover(isPresented: $showHistory) {
            HistoryView(history: viewModel.history) { item in
                viewModel.loadResult(item)
            }
        }
    }
}

#Preview {
    ContentView()
}
