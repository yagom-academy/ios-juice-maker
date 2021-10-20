//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func make(juice: JuiceRecipe) throws -> JuiceRecipe {
        let unavailableFruits = getUnavailableFruit(juice: juice)
        
        guard unavailableFruits.count == 0 else {
            throw FruitStoreError.insufficientFruits(unavailabeFruits: unavailableFruits)
        }
        
        for ingredient in juice.ingredients {
            fruitStore.changeInventory(ingredient.fruit, by: ingredient.amount)
        }
        return juice
    }
    
    func getUnavailableFruit(juice: JuiceRecipe) -> [Ingredient] {
        let unavailableFruits = juice.ingredients.filter( {(ingredient: Ingredient) -> Bool in
            return fruitStore.isUnavailable(fruit: ingredient.fruit, amount: ingredient.amount)
        })
        return unavailableFruits
    }
}
