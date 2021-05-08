import SwiftUI

struct AboutScreen: View {
    private let donateUrl = URL(string: "http://localhost:8000/cash.html?app=the%20StockTracker%20app")!

    var body: some View {
        Form {
            Text("about_donate_copy")
            Link(destination: donateUrl) {
                Label("about_donate_button", systemImage: "heart.fill")
            }
        }
        .navigationTitle("about_title")
    }
}
