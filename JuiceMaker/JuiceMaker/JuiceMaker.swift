//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


class JuiceMaker {
    func makeJuice(juiceType: JuiceRecipe) {
        let juiceIngredients: FruitTypeAndAmount = JuiceRecipe.getJuiceIngredients(of: juiceType)
        
        for (fruitType, fruitNumber) in juiceIngredients {
            FruitStockManager.decreaseStockAmount(of: fruitType, by: fruitNumber)
        }
    }
}
