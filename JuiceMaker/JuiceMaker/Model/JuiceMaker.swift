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
            guard (try? isHaveEnoughStock(fruitName: fruitName, juiceIngredient: Int)) != nil else {
                return false
            }
            confirmedFruitStock += 1
            guard confirmedFruitStock == juiceIngredientCounter, (try? stock.changeFruitStock(fruitName: fruitName, changingNumber: -juiceIngredient)) != nil else {
                continue
            }
        }
        return true
    }
    
    func isHaveEnoughStock(fruitName: FruitStore.Fruit, juiceIngredient: Int) throws {
        guard let fruitStock = stock.fruitStockList[fruitName] else {
            throw FruitStockError.fruitNotExist
        }
        guard fruitStock >= juiceIngredient else {
            throw FruitStockError.outOfStock
        }
    }
}
