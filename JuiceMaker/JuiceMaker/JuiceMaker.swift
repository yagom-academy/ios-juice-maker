//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


class JuiceMaker {
    let juiceRecipe: RecipeBook = JuiceRecipe().getJuiceIngredients()
    let fruitStockManager = FruitStockManager.shared
    
    func makeJuice(juiceName: String) {
        guard let juiceIngredients: FruitTypeAndAmount = juiceRecipe[juiceName] else { return }
        
        for (fruitType, fruitNumber) in juiceIngredients {
            fruitStockManager.decreaseStockAmount(of: fruitType, by: fruitNumber)
        }
    }
}
