//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func make(_ juice: JuiceMenu) throws -> JuiceMenu {
        guard hasAllIngredients(of: juice.recipe) else {
            throw FruitStoreError.deficientStock
        }
        
        for ingredient in juice.recipe.ingredients {
            fruitStore.decreaseStock(of: ingredient.fruit, by: ingredient.amount)
        }
        return juice
    }
    
    private func hasAllIngredients(of juiceRecipe: JuiceRecipe) -> Bool {
        for ingredient in juiceRecipe.ingredients {
            guard fruitStore.isAvailable(fruit: ingredient.fruit, requiredAmount: ingredient.amount) else {
                return false
            }
        }
        return true
    }
}
