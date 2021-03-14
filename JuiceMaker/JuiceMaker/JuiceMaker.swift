//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


class JuiceMaker {
    private let juiceRecipe = JuiceRecipe()
    private let fruitStockManager = FruitStockManager.shared
    
    func makeJuice(juiceName: String) {
        let juiceIngredients: FruitTypeAndAmount = juiceRecipe.getJuiceIngredients(of: juiceName)
        
        for (fruitType, fruitNumber) in juiceIngredients {
            fruitStockManager.decreaseStockAmount(of: fruitType, by: fruitNumber)
        }
    }
}
