//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import UIKit

struct JuiceMaker {
    var fruitStore: FruitStore = FruitStore()
    
    func makeJuice(ingredient: Juice) -> Bool {
        let haveEnoughIngredient = fruitStore.checkQuantity(requiredIngredient: ingredient.recipe[0])
        
        guard haveEnoughIngredient else {
            print("\(ingredient.recipe[0].name)가 충분하지 않습니다")
            return false
        }
        
        guard fruitStore.bringIngredients(ingredients: ingredient.recipe[0]) else {
            print("\(ingredient.recipe[0].name)주스가 만들어지지 못했습니다")
            return false
        }
    
        return true
    }
    
    func makeJuice(mixedIngredients: Juice) -> Bool {
        let haveEnoughIngredient1 = fruitStore.checkQuantity(requiredIngredient: mixedIngredients.recipe[0])
        
        guard haveEnoughIngredient1 else {
            print("\(mixedIngredients.recipe[0].name)가 충분하지 않습니다")
            return false
        }
        
        let haveEnoughIngredient2 = fruitStore.checkQuantity(requiredIngredient: mixedIngredients.recipe[1])
        
        guard haveEnoughIngredient2 else {
            print("\(mixedIngredients.recipe[1].name)가 충분하지 않습니다")
            return false
        }
        
        guard fruitStore.bringIngredients(ingredients: mixedIngredients.recipe[0]) else {
            print("\(mixedIngredients.recipe[0].name)주스가 만들어지지 못했습니다")
            return false
        }
        guard fruitStore.bringIngredients(ingredients: mixedIngredients.recipe[1]) else {
            print("\(mixedIngredients.recipe[1].name)주스가 만들어지지 못했습니다")
            return false
        }
    
        return true
    }
}
