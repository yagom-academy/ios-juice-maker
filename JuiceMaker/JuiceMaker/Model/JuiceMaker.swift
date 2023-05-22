//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore = FruitStore(fruitInventory: [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ])
    
    func readFruitInventory() -> [Fruit: Int] {
        return fruitStore.readFruitInventory()
    }
    
    func takeOrder(_ juice: Juice) throws {
        try makeJuice(juice)
    }
    
    private func makeJuice(_ juice: Juice) throws {
        try verifyStock(for: juice)
        try consumeFruit(for: juice)
    }

    private func verifyStock(for juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            try fruitStore.isStockSufficient(fruit, with: amount)
        }
    }
        
    private func consumeFruit(for juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            fruitStore.decreaseFruitStock(fruit, by: amount)
        }
    }
}
