//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var fruitStock: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func useValidStock(usedFruits: [JuiceRecipe]) throws {
        try usedFruits.forEach { try checkStock(usedFruit: $0) }
        usedFruits.forEach { updateStock(usedFruit: $0) }
    }
    
    private func checkStock(usedFruit: JuiceRecipe) throws {
        guard let currentAmount = fruitStock[usedFruit.fruit] else {
            throw FruitStoreError.notFoundKey(usedFruit.fruit)
        }
        
        guard currentAmount > usedFruit.amount else {
            throw FruitStoreError.notEnoughStock(usedFruit.fruit)
        }
    }
    
    private func updateStock(usedFruit: JuiceRecipe) {
        if let currentAmount = fruitStock[usedFruit.fruit] {
            fruitStock[usedFruit.fruit] = currentAmount - usedFruit.amount
        }
    }
}
