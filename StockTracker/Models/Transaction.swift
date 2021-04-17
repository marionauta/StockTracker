import Foundation
import RealmSwift

final class Transaction: Object, Identifiable {
    @objc dynamic var id = ObjectId.generate()
    @objc dynamic var ticker: String = ""
    @objc dynamic var count: Double = 0
    @objc dynamic var price: Double = 0
    @objc dynamic var effectiveDate: Date = Date()

    var totalPrice: Double {
        count * price
    }

    var currentPrice: Double {
        totalPrice * .random(in: 0.80...1.20)
    }

    convenience init(ticker: String, count: Double, price: Double, effectiveDate: Date = Date()) {
        self.init()
        self.ticker = ticker
        self.count = count
        self.price = price
        self.effectiveDate = effectiveDate
    }

    // Return the name of the primary key property
    override static func primaryKey() -> String? {
        return "id"
    }
}
