import SwiftUI

struct TransactionsScreen: View {
    @StateObject private var viewModel = TransactionsViewModel()

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(viewModel.transactions.indexed(), id: \.1.id) { index, transaction in
                    index > 0 ? Divider() : nil
                    TransactionRow(model: transaction)
                        .background(Color(UIColor.systemBackground))
                        .contextMenu {
                            Button {
                                viewModel.deleteTransaction(with: transaction.id)
                            } label: {
                                Label("transactions_delete", systemImage: "trash")
                            }
                        }
                }
            }
        }
        .onAppear(perform: viewModel.load)
        .navigationTitle("transactions_title")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("transactions_add_button", action: viewModel.addTransaction)
            }
        }
        .sheet(item: $viewModel.modalRoute) { _ in
            NavigationView {
                AddTransactionScreen(viewModel: viewModel)
            }
        }
    }
}
