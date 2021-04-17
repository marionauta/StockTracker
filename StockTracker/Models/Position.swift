import Foundation

struct Position {
    var current: Double
    var original: Double

    var delta: Double {
        current - original
    }

    var increase: Double {
        guard original != 0 else { return 0 }
        return delta / original
    }
}

struct StockPosition {
    let ticker: String
    var amount: Double
    var position: Position
}

extension StockPosition: Identifiable {
    var id: String {
        return ticker
    }
}

extension Array where Element == StockPosition {
    var totalPosition: Position {
        var current = 0.0
        var original = 0.0

        for position in self {
            current += position.position.current
            original += position.position.original
        }

        return .init(current: current, original: original)
    }
}
