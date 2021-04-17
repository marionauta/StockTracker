import SwiftUI

private let dollarFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = "USD"
    formatter.currencySymbol = "$"
    return formatter
}()

struct DollarView: View {
    let model: Double

    init(_ model: Double) {
        self.model = model
    }

    var body: some View {
        Text(model as NSObject, formatter: dollarFormatter)
    }
}
