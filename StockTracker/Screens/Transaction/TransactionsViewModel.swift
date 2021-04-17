import Foundation
import RealmSwift

final class TransactionsViewModel: ObservableObject {
    enum ModalRoute: Identifiable {
        var id: Self { self }

        case addTransaction
    }

    private var transactionsToken: NotificationToken?

    @Published var transactions: [Transaction] = []
    @Published var modalRoute: ModalRoute?

    public func load() {
        transactionsToken = TransactionDataSource.shared.getAll { [weak self] results in
            self?.transactions = Array(results)
        }
    }

    public func addTransaction() {
        modalRoute = .addTransaction
    }

    public func saveTransaction(_ transaction: Transaction) {
        try? TransactionDataSource.shared.add(transaction: transaction)
        modalRoute = nil
    }

    public func deleteTransaction(at offsets: IndexSet) {
        let transactions = offsets.map { index in self.transactions[safe: index] }.compactMap { $0 }
        for transaction in transactions {
            try? TransactionDataSource.shared.delete(id: transaction.id)
        }
    }
}
