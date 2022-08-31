//
//  JuiceMaker - FruitStore.swift
//  Created by Wonbi, woong
//

class FruitStore {
    static var stockManager = FruitStore()
    private var stock = [Fruits]()
    
    private init() {
        for fruit in Fruits.FruitType.fruitsList {
            stock.append(Fruits(name: fruit, count: 10))
        }
    }
    
    private func haveInStock(fruits: [Fruits]) -> Bool {
        for fruit in fruits {
            let stockCount = stock[fruit.fruitIndex].count
            let requestedCount = fruit.count
            if stockCount < requestedCount { return false }
        }
        return true
    }
    
    private func changeStock(fruit: Fruits) {
        stock.insert(fruit, at: fruit.fruitIndex)
    }
    
    private func addStock(fruits: [Fruits]) {
        for fruit in fruits {
            let stockCount = stock[fruit.fruitIndex].count
            let requestedCount = fruit.count
            changeStock(fruit: Fruits(name: fruit.name, count: stockCount + requestedCount))
        }
    }
    
    private func removeStock(fruits: [Fruits]) {
        for fruit in fruits {
            let stockCount = stock[fruit.fruitIndex].count
            let requestedCount = fruit.count
            changeStock(fruit: Fruits(name: fruit.name, count: stockCount - requestedCount))
        }
    }
    
    func supplyRequest(fruits: [Fruits]) -> [Fruits]? {
        guard haveInStock(fruits: fruits) else { return nil }
        
        removeStock(fruits: fruits)
        return fruits
    }
}
