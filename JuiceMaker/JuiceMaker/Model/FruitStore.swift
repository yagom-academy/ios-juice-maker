import Foundation

enum FruitType: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}

class FruitStore {
    
    let defaultNumberOfStock = 10
    var fruits: [FruitType: Int] = [:]
    
    init() {
        for fruit in FruitType.allCases {
            fruits[fruit] = defaultNumberOfStock
        }
    }
    
    func increaseStock(fruit: FruitType, amount: Int) {
        guard let currentStock = fruits[fruit] else { return }
        fruits.updateValue(currentStock + amount, forKey: fruit)
    }
    
    func decreaseStock(fruit: FruitType, amount: Int) throws {
        guard let currentStock = fruits[fruit] else { return }
        guard currentStock >= amount else { throw ErrorType.notEnoughStock }
        fruits.updateValue(currentStock - amount, forKey: fruit)
    }
}

