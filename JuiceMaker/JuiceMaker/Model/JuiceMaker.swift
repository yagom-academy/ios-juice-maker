//
//  JuiceMaker - JuiceMaker.swift
//  Created by Quokkaaa.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func order(for menu: Juice) -> Bool {
        if readyToMake(juice: menu) {
            make(juice: menu)
        } else {
            return false
        }
        return true
    }
    
    private func readyToMake(juice: Juice) -> Bool {
        for (fruit, juiceIngredient) in juice.recipe {
            guard isHaveEnoughStock(of: fruit, for: juiceIngredient) else {
                return false
            }
        }
        return true
    }
    
    private func isHaveEnoughStock(of fruit: FruitStore.Fruit, for juiceIngredient: Int) -> Bool {
        guard let currentStock = fruitStore.fruits[fruit],
              juiceIngredient > 0,
              currentStock - juiceIngredient >= 0 else {
                  return false
              }
        return true
    }
    
    private func make(juice: Juice) {
        for (fruit, juiceIngredient) in juice.recipe {
            fruitStore.manageStock(of: fruit, amount: -juiceIngredient)
        }
    }
}
