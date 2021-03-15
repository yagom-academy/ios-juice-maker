//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


class JuiceMaker {
    private let juiceRecipe = JuiceRecipe()
    
    func makeJuice(juiceName: String) {
        guard let juiceIngredients: FruitTypeAndAmount = juiceRecipe.getJuiceIngredients(of: juiceName) else { return }
        
        for (fruitType, fruitNumber) in juiceIngredients {
            FruitStockManager.decreaseStockAmount(of: fruitType, by: fruitNumber)
        }
    }
}
