import Foundation

enum DefaulSetting {
    static let stock = 10
}

class FruitStore {
    private var fruitsInventory : [Fruit : Int] = [:]
    
    init() {
        Fruit.allCases.forEach { fruitsInventory[$0] = DefaulSetting.stock }
    }
    
    func isEnoughStock(for juiceIngredient: [Fruit : Int]) -> Bool {
        for (fruit, requiredAmount) in juiceIngredient {
            guard let fruitStoreStock = fruitsInventory[fruit], fruitStoreStock >= requiredAmount  else {
                return false
            }
        }
        return true
    }
    func decreaseFruitStock(by juiceIngredient: [Fruit : Int]) {
        for (fruit, requiredAmount) in juiceIngredient {
            if var fruitStoreStock = fruitsInventory[fruit] {
                fruitStoreStock -= requiredAmount
                fruitsInventory[fruit] = fruitStoreStock
            }
        }
    }
}
