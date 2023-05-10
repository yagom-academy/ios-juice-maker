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
        try juiceRecipes.forEach { try checkStock(juiceRecipe: $0) }
        juiceRecipes.forEach { updateStock(juiceRecipe: $0) }
    }
    
    private func checkStock(juiceRecipe: JuiceRecipe) throws {
        guard let currentAmount = fruitStock[juiceRecipe.fruit] else {
            throw FruitStoreError.notFoundKey(juiceRecipe.fruit)
        }
        
        guard currentAmount > juiceRecipe.amount else {
            throw FruitStoreError.notEnoughStock(juiceRecipe.fruit)
        }
    }
    
    private func updateStock(juiceRecipe: JuiceRecipe) {
        if let currentAmount = fruitStock[juiceRecipe.fruit] {
            fruitStock[juiceRecipe.fruit] = currentAmount - juiceRecipe.amount
        }
    }
}
