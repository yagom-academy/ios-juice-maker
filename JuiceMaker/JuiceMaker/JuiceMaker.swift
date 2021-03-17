//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class JuiceMaker {
    private func checkFruitStock(of juice: JuiceRecipe) -> Bool {
        for ingredient in juice.ingredients {
            if ingredient.amount < ingredient.fruit.amount {
                return true
            }
        }
        return false
    }
    
    func makeJuice(name: JuiceRecipe) -> String {
        if checkFruitStock(of: name) {
            for ingredient in name.ingredients {
                ingredient.fruit.reducefruit(amount: ingredient.amount)
            }
            return ResultMessages.successMessage
        } else {
            return ResultMessages.failureMessage
        }
    }
}
