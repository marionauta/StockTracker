import SwiftUI

struct AboutScreen: View {
    @StateObject private var viewModel = AboutViewModel()

    private let donateUrl = URL(string: "https://mario.nachbaur.dev/tips?app=the%20StockTracker%20app")!

    var body: some View {
        Form {
            Text("about_donate_copy")
            Button(action: viewModel.openDonateScreen) {
                Label("about_donate_button", systemImage: "heart.fill")
            }
        }
        .navigationTitle("about_title")
        .sheet(isPresented: $viewModel.isDonateOpen) {
            InAppBrowserScreen(url: donateUrl)
        }
    }
}
