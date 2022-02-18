//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    private var fruitStore: Store
    
    init(fruitStore: Store = FruitStore()) {
        self.fruitStore = fruitStore
    }
    
    mutating func takeOrder(recipeType: JuiceRecipeType) throws -> String {
        let ingredients = recipeType.recipe.ingredients
        if !fruitStore.checkStock(of: ingredients) {
            throw JuiceMakerError.notEnough
        }
        fruitStore.makeDrink(of: ingredients)
        return recipeType.name
    }
}
