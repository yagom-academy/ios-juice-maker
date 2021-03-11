import Foundation

typealias Storage = [Fruits : Int]

enum Fruits: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juices {
    case strawberryJuice, bananaJuice, pineappleJuice, kiwiJuice, mangoJuice, strawberryBananaJuice, mangoKiwiJuice
    
    var recipe : Storage {
        switch self {
        case .strawberryJuice:
            return [.strawberry : 16]
        case .bananaJuice:
            return [.banana : 2]
        case .pineappleJuice:
            return [.pineapple : 2]
        case .kiwiJuice:
            return [.kiwi : 3]
        case .mangoJuice:
            return [.mango : 3]
        case .strawberryBananaJuice:
            return [.strawberry : 10, .banana : 1]
        case .mangoKiwiJuice:
            return [.mango : 2, .kiwi : 1]
        }
    }
}

class FruitStock {
    public private(set) var fruits: Storage
    
    static let shared = FruitStock()
    
    private init() {
        self.fruits = [:]
        initStorage(amount: 10)
    }
    
    func manageStorage(fruit kind: Fruits, amount: Int) throws {
        guard let stock = fruits[kind] else {
            throw StockError.inValidStock
        }
        fruits.updateValue(stock + amount, forKey: kind)
    }
    
    private func initStorage(amount: Int) {
        for kindFruit in Fruits.allCases {
            fruits.updateValue(amount, forKey: kindFruit)
        }
    }
}
