import SwiftUI

struct HistoryView: View {
    let history: [HistoryItem]
    let onSelect: (HistoryItem) -> Void
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            Group {
                if history.isEmpty {
                    VStack {
                        Spacer()
                        Text("No history yet")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                } else {
                    List(history.reversed()) { item in
                        Button(action: {
                            onSelect(item)
                            dismiss()
                        }) {
                            Text(item.expression)
                                .foregroundColor(.primary)
                        }
                    }
                }
            }
            .navigationTitle("History")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Back") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    HistoryView(
        history: [
            HistoryItem(expression: "1 + 3 = 4", result: "4"),
            HistoryItem(expression: "10 × 5 = 50", result: "50")
        ],
        onSelect: { _ in }
    )
}
