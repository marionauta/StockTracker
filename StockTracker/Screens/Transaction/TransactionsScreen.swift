import SwiftUI

struct TransactionsScreen: View {
    @StateObject private var viewModel = TransactionsViewModel()

    var body: some View {
        List {
            ForEach(viewModel.transactions) { transaction in
                TransactionRow(model: transaction)
            }
            .onDelete(perform: viewModel.deleteTransaction(at:))
        }
        .listStyle(PlainListStyle())
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
