import SwiftUI

private let percentFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .percent
    formatter.minusSign = ""
    formatter.minimumFractionDigits = 2 
    return formatter
}()

struct PercentIncreaseView: View {
    let percent: Double

    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Image(systemName: arrowIconName)
                .resizable()
                .frame(width: 8, height: 8, alignment: .center)
                .accessibility(label: Text(arrowIconLabel))
                .accessibility(removeTraits: .isImage)

            Text(percent as NSObject, formatter: percentFormatter)
        }
        .foregroundColor(foregroundColor)
        .accessibilityElement(children: .combine)
    }

    private var foregroundColor: Color {
        if percent == 0 {
            return .secondary
        } else if percent > 0 {
            return Color("Increase")
        } else {
            return Color("Decrease")
        }
    }

    private var arrowIconName: String {
        if percent == 0 {
            return "equal"
        } else if percent > 0 {
            return "arrowtriangle.up.fill"
        } else {
            return "arrowtriangle.down.fill"
        }
    }

    private var arrowIconLabel: LocalizedStringKey {
        if percent >= 0 {
            return "percent_increase"
        } else {
            return "percent_decrease"
        }
    }
}
