import SwiftUI

struct TrackerScreen: View {
    @StateObject private var viewModel = TrackerViewModel()

    var body: some View {
        VStack {
            ScrollView {
                MainPositionView(model: viewModel.positions.totalPosition)

                LazyVStack {
                    ForEach(viewModel.positions) { position in
                        StockRow(model: position)
                    }
                }
            }
        }
        .navigationTitle("tracker_title")
        .onAppear(perform: viewModel.load)
    }
}
