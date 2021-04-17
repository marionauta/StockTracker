import SwiftUI

private let dateFormatter = DateFormatter().apply {
    $0.setLocalizedDateFormatFromTemplate("yyyy MMMM d")
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
                Text("\(model.count) stock_count")
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 1.units.cg)
    }
}
