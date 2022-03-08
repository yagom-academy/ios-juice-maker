import Foundation

final class FruitStore {
    private enum DefaulSetting {
        static let stock = 10
    }
    private(set) var inventory: [Fruit: Int] = [:]
    
    init() {
        Fruit.allCases.forEach { inventory[$0] = DefaulSetting.stock }
    }
    
    func decreaseFruitStock(by ingredient: [Fruit: Int]) throws {
        for (fruit, requiredAmount) in ingredient {
            guard let currentAmount = inventory[fruit], currentAmount >= requiredAmount else {
                throw JuiceMakingError.outOfStock
            }
            let remainingAmount = currentAmount - requiredAmount
            inventory[fruit] = remainingAmount
        }
    }
    
    func updateInventory(fruit: Fruit, value: Int) {
        inventory[fruit] = value
    }
}
