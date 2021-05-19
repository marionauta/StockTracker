import SwiftUI

final class AboutViewModel: ObservableObject {
    @Published var isDonateOpen = false

    public func openDonateScreen() {
        isDonateOpen = true
    }
}
