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
    
    func make(juice: JuiceMenu) throws -> JuiceMenu {
        let unavailableIngredients = getUnavailableIngredients(of: juice.recipe)
        
        guard unavailableIngredients.isEmpty else {
            throw FruitStoreError.deficientStock(unavailableIngredients: unavailableIngredients)
        }
        
        for ingredient in juice.recipe.ingredients {
            fruitStore.decreaseStock(of: ingredient.fruit, by: ingredient.amount)
        }
        return juice
    }
    
    private func getUnavailableIngredients(of juiceRecipe: JuiceRecipe) -> [Ingredient] {
        let unavailableIngredients = juiceRecipe.ingredients.filter( {(ingredient: Ingredient) -> Bool in
            return fruitStore.isUnavailable(fruit: ingredient.fruit, requiredAmount: ingredient.amount)
        })
        return unavailableIngredients
    }
}
