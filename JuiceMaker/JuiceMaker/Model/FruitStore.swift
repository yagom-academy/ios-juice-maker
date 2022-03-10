import Foundation

class FruitStore {
    static let minimumNumberOfStock = 0
    static let defaultNumberOfStock = 10
    private var fruits: [FruitType: Int] = [:]
    
    init() {
        for fruit in FruitType.allCases {
            fruits[fruit] = FruitStore.defaultNumberOfStock
        }
    }
    
    func increaseStock(fruit: FruitType, amount: Int) {
        let currentStock = numberOfStock(fruit: fruit)
        fruits.updateValue(currentStock + amount, forKey: fruit)
    }
    
    func decreaseStock(fruit: FruitType, amount: Int) throws {
        let currentStock = numberOfStock(fruit: fruit)
        guard currentStock >= amount else { throw JuiceMakerError.outOfStockRange }
        fruits.updateValue(currentStock - amount, forKey: fruit)
    }
    
    func numberOfStock(fruit: FruitType) -> Int {
        guard let currentStock = fruits[fruit] else { return FruitStore.minimumNumberOfStock }
        return currentStock
    }
}

