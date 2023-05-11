//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var fruitStock: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .mango: 10,
        .kiwi: 10,
        .pineapple: 10
    ]
    
    init(fruitStock: [Fruit: Int]) {
        self.fruitStock = fruitStock
    }
    
    func useValidStock(juiceRecipes: Recipe) throws {
        try juiceRecipes.forEach { try validateStock(juiceIngrediant: $0) }
        juiceRecipes.forEach { spendStock(amount: $0.amount, at: $0.fruit)}
    }
    
    private func validateStock(juiceIngrediant: Ingredient) throws {
        guard let currentAmount = fruitStock[juiceIngrediant.fruit] else {
            throw FruitStoreError.notFoundFruit(juiceIngrediant.fruit)
        }
        
        guard currentAmount >= juiceIngrediant.amount else {
            throw FruitStoreError.notEnoughStock(juiceIngrediant.fruit)
        }
    }
    
    private func spendStock(amount value: Int, at key: Fruit) {
        if let currentAmount = fruitStock[key] {
            fruitStock[key] = currentAmount - value
        }
    }
    
    func updateStock(newValue: Int, at key: Fruit) {
        self.fruitStock.updateValue(newValue, forKey: key)
    }    
}
