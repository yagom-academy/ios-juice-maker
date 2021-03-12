import Foundation

typealias Storage = [Fruits : Int]

enum Fruits: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juices: Int {
    case strawberryJuice = 1
    case bananaJuice = 2
    case pineappleJuice = 3
    case kiwiJuice = 4
    case mangoJuice = 5
    case strawberryBananaJuice = 6
    case mangoKiwiJuice = 7
    
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

extension Juices: CustomStringConvertible {
    var description: String {
        switch self {
        case .strawberryJuice:
            return "딸기 쥬스"
        case .bananaJuice:
            return "바나나 쥬스"
        case .pineappleJuice:
            return "파인애플 쥬스"
        case .kiwiJuice:
            return "키위 쥬스"
        case .mangoJuice:
            return "망고 쥬스"
        case .strawberryBananaJuice:
            return "딸기 바나나 쥬스"
        case .mangoKiwiJuice:
            return "망고 키위 쥬스"
        }
    }
}

class FruitStock {
    public private(set) var fruits: Storage = [:]
    
    init(initAmount: Int) {
        for kindFruit in Fruits.allCases {
            fruits.updateValue(initAmount, forKey: kindFruit)
        }
    }
    
    func manageStorage(fruit kind: Fruits, amount: Int) throws {
        guard let stock = fruits[kind] else {
            throw StockError.inValidStock
        }
        fruits.updateValue(stock + amount, forKey: kind)
    }
}
