import SwiftUI

private let formatter = NumberFormatter().apply {
    $0.minimumFractionDigits = 0
    $0.maximumFractionDigits = 2
}

struct StockRow: View {
    var model: StockPosition

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.ticker)

                HStack(alignment: .firstTextBaseline, spacing: 4) {
                    Text(model.amount as NSNumber, formatter: formatter)
                    Text("\(model.amount) stock_count")
                }
                .foregroundColor(.secondary)
                .accessibilityElement(children: .combine)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 0.4.units.cg) {
                DollarView(model.position.current)
                PercentIncreaseView(percent: model.position.increase)
            }
        }
        .padding(.horizontal, 2.units.cg)
        .padding(.vertical, 1.units.cg)
    }
}
