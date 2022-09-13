//
//  JuiceMaker - FruitStore.swift
//  Created by Wonbi, woong
//

import Foundation

class FruitStore {
    private(set) var stock: [Int]
    
    init(stockCount: Int) {
        let count = Fruit.allCases.count
        self.stock = [Int](repeating: stockCount, count: count)
    }
    
    private func haveInStock(ingredient: [(Fruit, Int)]) -> Bool {
        for (fruit, count) in ingredient {
            let stockCount = stock[fruit.index]
            
            if stockCount < count {
                return false
            }
        }
        return true
    }

    func changeStock(fruitIndex: Int, count: Int) {
        stock[fruitIndex] = count
    }
    
    private func removeStock(fruit: Fruit, count: Int) {
        let stockCount = stock[fruit.index]
        let computedCount = stockCount - count
        
        stock[fruit.index] = computedCount
    }
    
    func canSupplyRequest(ingredient: [(Fruit, Int)]) -> Bool {
        guard haveInStock(ingredient: ingredient) else {
            return false
        }
        
        for (fruit, count) in ingredient {
            removeStock(fruit: fruit, count: count)
        }
        return true
    }
}
