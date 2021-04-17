import Foundation
import RealmSwift

final class TransactionDataSource {
    private let realm = try! Realm()

    public static let shared = TransactionDataSource()

    private init() {}

    public func get(with id: ObjectId) -> Transaction? {
        return realm.object(ofType: Transaction.self, forPrimaryKey: id)
    }

    public func getAll(callback: @escaping (Results<Transaction>) -> Void) -> NotificationToken {
        let query = realm.objects(Transaction.self).sorted(byKeyPath: "effectiveDate", ascending: false)
        return query.observe { changes in
            switch changes {
            case let .initial(transactions), let .update(transactions, _, _, _):
                callback(transactions)

            case let .error(error):
                print(#function, #line, error.localizedDescription)
            }
        }
    }

    public func add(transaction: Transaction) throws {
        try realm.write {
            realm.add(transaction)
        }
    }

    public func delete(id: ObjectId) throws {
        guard let transaction = get(with: id) else { return }

        try realm.write {
            realm.delete(transaction)
        }
    }
}
