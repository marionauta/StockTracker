import SwiftUI

struct StockRow: View {
    var model: StockPosition

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(model.ticker)
                Text("\(model.amount) stock_count")
                    .foregroundColor(.secondary)
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 0.4.units.cg) {
                DollarView(model.position.current)
                PercentIncreaseView(percent: model.position.increase)
            }
        }
        .padding([.horizontal, .bottom], 2.units.cg)
    }
}
