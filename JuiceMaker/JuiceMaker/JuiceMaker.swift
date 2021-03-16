//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


class JuiceMaker {
    func makeJuice(juiceType: String) {
        let recipeBook = RecipeBook()
        let fruitStockManager = FruitStockManager()
        guard let juiceIngredients: FruitTypeAndAmount = recipeBook.getJuiceIngredients(of: juiceType) else { return }
        
        for (fruitType, fruitNumber) in juiceIngredients {
            fruitStockManager.decreaseStockAmount(of: fruitType, by: fruitNumber)
        }
    }
}
