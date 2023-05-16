//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias Recipe = [Ingredient]
typealias Ingredient = (fruit: Fruit, amount: Int)

class FruitStore {
    var fruitStock: [Fruit: Int]
    
    init(fruitStock: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .mango: 10,
        .kiwi: 10,
        .pineapple: 10
    ]) {
        self.fruitStock = fruitStock
    }
    
    func useValidStock(juiceRecipe: Recipe) throws {
        try juiceRecipe.forEach { try validateStock(ingredient: $0) }
        juiceRecipe.forEach { spendStock(of: $0.fruit, by: $0.amount)}
        NotificationCenter.default.post(name: NSNotification.Name("updatedStock"), object: nil, userInfo: ["fruitStock" : fruitStock])
    }
    
    private func validateStock(ingredient: Ingredient) throws {
        guard let currentAmount = self.fruitStock[ingredient.fruit] else {
            throw FruitStoreError.notFoundFruit(ingredient.fruit)
        }
        
        guard currentAmount >= ingredient.amount else {
            throw FruitStoreError.notEnoughStock(ingredient.fruit)
        }
    }
    
    private func spendStock(of fruit: Fruit, by amount: Int) {
        if let currentAmount = self.fruitStock[fruit] {
            fruitStock[fruit] = currentAmount - amount
        }
    }
    
    func updateStock(of fruit: Fruit, by amount: Int) {
        self.fruitStock.updateValue(amount, forKey: fruit)
    }    
}
