import SwiftUI

struct TrackerScreen: View {
    @StateObject private var viewModel = TrackerViewModel()

    var body: some View {
        ScrollView {
            MainPositionView(model: viewModel.positions.totalPosition)

            LazyVStack {
                ForEach(viewModel.positions.indexed(), id: \.1.id) { index, position in
                    index > 0 ? Divider() : nil
                    StockRow(model: position)
                }
            }
        }
        .navigationTitle("tracker_title")
        .onAppear(perform: viewModel.load)
    }
}
