//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func make(juice: JuiceMenu) throws -> JuiceMenu {
        guard hasAllIngredients(of: juice.recipe) else {
            throw FruitStoreError.deficientStock
        }
        
        fruitStore.reduceInventory(ingredientsOf: juice.recipe)
        return juice
    }
    
    private func hasAllIngredients(of juiceRecipe: JuiceRecipe) -> Bool {
        return fruitStore.canProvideIngredients(of: juiceRecipe)
    }
}
