//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitStock: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func add(_ fruit: Fruit, amountOf amount: Int) {
        if let currentStock = fruitStock[fruit] {
            let totalStock = currentStock + amount
            fruitStock.updateValue(totalStock, forKey: fruit)
        }
    }
    
    func use(_ fruit: Fruit, amountOf amount: Int) {
        if let currentStock = fruitStock[fruit] {
            let totalStock = currentStock - amount
            fruitStock.updateValue(totalStock, forKey: fruit)
        }
    }
    
    func checkStock(for juice: JuiceMaker.Juice) throws {
        let recipe = juice.recipe
        for (fruit, amount) in recipe.ingredient {
            guard let currentStock = fruitStock[fruit] else {
                throw JuiceMakerError.invalidFruit
            }
            
            guard currentStock >= amount else {
                throw JuiceMakerError.outOfStock
            }
        }
    }
}
