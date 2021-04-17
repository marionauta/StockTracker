import Combine
import SwiftUI

// Adapted from:
// https://augmentedcode.io/2020/04/26/validating-string-in-textfield-with-numberformatter-in-swiftui/
struct NumberTextField: View {
    @ObservedObject private var stringTransformer: StringTransformer
    private let title: LocalizedStringKey

    init(_ title: LocalizedStringKey, value: Binding<Double?>, formatter: NumberFormatter) {
        self.title = title
        self.stringTransformer = StringTransformer(value, formatter: formatter)
    }

    var body: some View {
        TextField(title, text: $stringTransformer.stringValue)
    }
}

fileprivate extension NumberTextField {
    final class StringTransformer: ObservableObject {
        private var cancellable: AnyCancellable?

        @Published var stringValue: String = ""

        init(_ value: Binding<Double?>, formatter: NumberFormatter) {
            // NSNumber -> String
            if let value = value.wrappedValue {
                stringValue = formatter.string(from: value as NSNumber) ?? ""
            } else {
                stringValue = ""
            }

            // String -> NSNumber
            cancellable = $stringValue.dropFirst().receive(on: RunLoop.main).sink { [weak self] (editingString) in
                if let number = formatter.number(from: editingString) {
                    value.wrappedValue = Double(truncating: number)

                } else if !editingString.isEmpty {
                    // Force current model value when editing value is invalid (invalid value or out of range).
                    if let value = value.wrappedValue {
                        self?.stringValue = formatter.string(from: value as NSNumber) ?? ""
                    } else {
                        self?.stringValue = ""
                    }
                }
            }
        }
    }
}
