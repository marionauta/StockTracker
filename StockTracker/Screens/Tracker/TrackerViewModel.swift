import Foundation
import RealmSwift

final class TrackerViewModel: ObservableObject {
    private var transactionsToken: NotificationToken?

    @Published var positions: [StockPosition] = []

    public func load() {
        guard transactionsToken == nil else { return }

        transactionsToken = TransactionDataSource.shared.getAll { [weak self] results in
            self?.buildPositions(from: results)
        }
    }

    private func buildPositions(from transactions: Results<Transaction>) {
        positions = Dictionary(grouping: transactions, by: \.ticker)
            .map { ticker, transactions -> StockPosition in
                let totalPrice = transactions.map(\.totalPrice).reduce(0, +)
                let currentPrice = transactions.map(\.currentPrice).reduce(0, +)
                let position = Position(current: currentPrice, original: totalPrice)
                let count = transactions.map(\.count).reduce(0, +)
                return StockPosition(ticker: ticker, amount: count, position: position)
            }
            .sorted { $0.position.current > $1.position.current }
    }
}
