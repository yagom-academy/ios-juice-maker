import Foundation

final class FruitStore {
    private enum DefaulSetting {
        static let stock = 10
    }
    private var inventory: [Fruit: Int] = [:]
    
    init() {
        Fruit.allCases.forEach { inventory[$0] = DefaulSetting.stock }
    }
    
    func decreaseFruitStock(by ingredient: [Fruit: Int]) throws {
        for (fruit, requiredAmount) in ingredient {
            if let currentAmount = inventory[fruit], currentAmount >= requiredAmount {
                let remainingAmount = currentAmount - requiredAmount
                inventory[fruit] = remainingAmount
            } else {
                throw JuiceMakingError.outOfStock
            }
        }
    }
}
