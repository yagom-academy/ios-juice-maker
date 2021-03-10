import Foundation

typealias Storage = [Fruits : Int]

enum StockError: Error {
    case lackStock
    case inValidStock
    case unknown
}
enum Fruits: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}
enum Juices {
    case strawberryJuice, bananaJuice, pineappleJuice, kiwiJuice, mangoJuice, strawberryBananaJuice, mangoKiwiJuice
    
    var juiceRecipe : Storage {
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
    public private(set) var fruits: Storage = [:]
    
    static let shared = FruitStock(initFruitAmount: 10)
    
    func fruitManager(fruit Whatfruit: Fruits, amount thisFruitAmount: Int) throws {
        guard let stock = fruits[Whatfruit] else {
            throw StockError.inValidStock
        }
        fruits.updateValue(stock + thisFruitAmount, forKey: Whatfruit)
    }
    
    init(initFruitAmount: Int) {
        for whatFruit in Fruits.allCases {
            fruits.updateValue(initFruitAmount, forKey: whatFruit)
        }
    }
}
