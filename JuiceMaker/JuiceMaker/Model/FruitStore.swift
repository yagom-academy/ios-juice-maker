import Foundation

class FruitStore {
    
    let defaultNumberOfStock = ConstantNameSpace.defaultNumberOfStock
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
        guard currentStock >= amount else { throw JuiceMakerError.outOfStockRange }
        fruits.updateValue(currentStock - amount, forKey: fruit)
    }
}

