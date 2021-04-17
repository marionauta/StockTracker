import SwiftUI

struct MainScreen: View {
    enum Tab: CaseIterable {
        case tracker, transactions

        @ViewBuilder var view: some View {
            switch self {
            case .tracker:
                TrackerScreen()
                    .modifier(WithNavigationModifier())

            case .transactions:
                TransactionsScreen()
                    .modifier(WithNavigationModifier())
            }
        }

        @ViewBuilder var label: some View {
            switch self {
            case .tracker:
                Label("tracker_tab_title", systemImage: "dollarsign.circle")
            case .transactions:
                Label("transactions_tab_title", systemImage: "list.bullet")
            }
        }
    }

    var body: some View {
        TabView {
            ForEach(Tab.allCases, id: \.self) { route in
                route.view
                    .tabItem { route.label }
            }
        }
    }
}
