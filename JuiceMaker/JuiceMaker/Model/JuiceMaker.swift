//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    var fruitStore: FruitStore = FruitStore()
    
    func readFruitInventory() -> [Fruit: Int] {
        return fruitStore.readFruitInventory()
    }
    
    func takeOrder(_ juice: Juice) throws {
        try verifyStock(for: juice)
        consumeFruit(for: juice)
    }

    private func verifyStock(for juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            try fruitStore.isStockSufficient(fruit, with: amount)
        }
    }
        
    private func consumeFruit(for juice: Juice) {
        for (fruit, amount) in juice.recipe {
            fruitStore.decreaseFruitStock(fruit, by: amount)
        }
    }
}
