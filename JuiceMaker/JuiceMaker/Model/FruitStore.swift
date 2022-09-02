//
//  JuiceMaker - FruitStore.swift
//  Created by Wonbi, woong
//

class FruitStore {
    private var stock = [Int](repeating: 10, count: 5)
    
    private func haveInStock(fruits: [Fruits]) -> Bool {
        for fruit in fruits {
            let stockCount = stock[fruit.fruitIndex]
            let requestedCount = fruit.count
            if stockCount < requestedCount { return false }
        }
        return true
    }
    
    private func changeStock(_ fruit: Fruits, count: Int) {
        stock[fruit.fruitIndex] = count
    }
    
    private func addStock(fruit: Fruits, isNegative: Bool = false) {
        let stockCount = stock[fruit.fruitIndex]
        let requestedCount = fruit.count
        
        var count: Int {
            isNegative ? stockCount - requestedCount : stockCount + requestedCount
        }
        
        changeStock(fruit, count: count)
    }
    
    func canSupplyRequest(_ fruits: [Fruits]) -> Bool {
        guard haveInStock(fruits: fruits) else {
            print("재고가 부족합니다.")
            return false
        }
        
        for fruit in fruits {
            addStock(fruit: fruit, isNegative: true)
        }
        return true
    }
}
