import SwiftUI

struct WithNavigationModifier: ViewModifier {
    func body(content: Content) -> some View {
        NavigationView {
            content
        }
    }
}
