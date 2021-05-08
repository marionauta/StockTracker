import SwiftUI

private let countFormatter = NumberFormatter().apply {
    $0.maximumFractionDigits = 8
}

private let priceFormatter = NumberFormatter().apply {
    $0.maximumFractionDigits = 4
}

struct AddTransactionScreen: View {
    var viewModel: TransactionsViewModel

    @State private var ticker = ""
    @State private var count: Double? = nil
    @State private var price: Double? = nil
    @State private var effectiveDate = Date()

    var body: some View {
        Form {
            TextField("transactions_add_ticker", text: $ticker)
                .autocapitalization(.allCharacters)
                .disableAutocorrection(true)

            NumberTextField("transactions_add_count", value: $count, formatter: countFormatter)
                .keyboardType(.decimalPad)

            NumberTextField("transactions_add_price", value: $price, formatter: priceFormatter)
                .keyboardType(.decimalPad)

            DatePicker("transactions_add_date", selection: $effectiveDate)

            Section {
                Button("transactions_add_save") {
                    guard let count = count, let price = price, !ticker.isEmpty else { return }
                    let transaction = Transaction(
                        ticker: ticker,
                        count: count,
                        price: price,
                        effectiveDate: effectiveDate
                    )
                    viewModel.saveTransaction(transaction)
                }
            }
        }
        .navigationTitle("transactions_add_title")
    }
}
