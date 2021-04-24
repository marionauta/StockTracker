import SwiftUI

private let dateFormatter = DateFormatter().apply {
    $0.setLocalizedDateFormatFromTemplate("yyyy MMMM d")
}

private let stockFormatter = NumberFormatter().apply {
    $0.minimumFractionDigits = 0
    $0.maximumFractionDigits = 2
}

struct TransactionRow: View {
    let model: Transaction

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.ticker)
                Text(model.effectiveDate, formatter: dateFormatter)
                    .foregroundColor(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing) {
                DollarView(-1 * model.count * model.price)
                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text(model.count as NSNumber, formatter: stockFormatter)
                    Text("\(model.count) stock_count")
                }
                .foregroundColor(.secondary)
                .accessibilityElement(children: .combine)
            }
        }
        .padding(.vertical, 1.units.cg)
    }
}
