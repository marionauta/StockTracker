import SwiftUI

struct MainPositionView: View {
    let model: Position

    var body: some View {
        VStack(alignment: .center, spacing: 1.units.cg) {
            DollarView(model.current)
                .font(.system(.largeTitle, design: .rounded))

            HStack {
                DollarView(model.delta)
                PercentIncreaseView(percent: model.increase)
            }
        }
        .padding()
    }
}
