//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var fruitStock: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ]
    
    func useValidStock(juiceRecipes: [JuiceRecipe]) throws {
        try juiceRecipes.forEach { try validateStock(juiceRecipe: $0) }
        juiceRecipes.forEach { calculateStock(amount: $0.amount * -1, at: $0.fruit)}
    }
    
    private func validateStock(juiceRecipe: JuiceRecipe) throws {
        guard let currentAmount = fruitStock[juiceRecipe.fruit] else {
            throw FruitStoreError.notFoundFruit(juiceRecipe.fruit)
        }
        
        guard currentAmount >= juiceRecipe.amount else {
            throw FruitStoreError.notEnoughStock(juiceRecipe.fruit)
        }
    }
    
    private func calculateStock(amount value: Int, at key: Fruit) {
        if let currentAmount = fruitStock[key] {
            fruitStock[key] = currentAmount + value
        }
    }
}
