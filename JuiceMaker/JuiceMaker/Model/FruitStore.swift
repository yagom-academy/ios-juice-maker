import Foundation

final class FruitStore {
    private enum DefaulSetting {
        static let stock = 10
    }
    static let shared = FruitStore()
    var inventory: [Fruit: Int] = [:]
    
    private init() {
        Fruit.allCases.forEach { inventory[$0] = DefaulSetting.stock }
    }
    
    func canDecreaseFruitStock(by ingredient: [Fruit: Int]) throws -> Bool {
        for (fruit, requiredAmount) in ingredient {
            guard let currentAmount = inventory[fruit], currentAmount >= requiredAmount else {
                throw JuiceMakingError.outOfStock
            }
            let remainingAmount = currentAmount - requiredAmount
            inventory[fruit] = remainingAmount
        }
        return true
    }
}
