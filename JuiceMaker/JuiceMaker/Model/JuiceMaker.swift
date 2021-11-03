//
//  JuiceMaker - JuiceMaker.swift
//  Created by Quokkaaa.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct JuiceMaker {
    func orderJuice(for menu: Juice) -> Bool {
        var confirmedFruitStock = 0
        let juiceIngredientCounter = menu.recipe.count
        
        for (fruitName, juiceIngredient) in menu.recipe {
            guard isHaveEnoughStock(fruitName: fruitName, juiceIngredient: Int) else {
                return false
            }
            confirmedFruitStock += 1
            guard confirmedFruitStock == juiceIngredientCounter, stock.changeFruitStock(fruitName: fruitName, changingNumber: -juiceIngredient) else {
                continue
            }
        }
        return true
    }
    
    func isHaveEnoughStock(fruitName: FruitStore.Fruit, juiceIngredient: Int) -> Bool {
        guard let fruitStock = stock.fruitStockList[fruitName] else {
            return false
        }
        guard fruitStock >= juiceIngredient else {
            return false
        }
        return true
    }
}
