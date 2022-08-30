//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore()
    
    func make(juice: Juice) throws {
        do {
            let recipe = juice.recipe
            
            if try fruitStore.hasEnoughInventory(reduced: recipe) {
                try fruitStore.reduceInventory(of: recipe)
            } else {
                throw FruitStoreError.insufficientInventory
            }
        } catch {
            throw FruitStoreError.emptyFruit
        }
    }
}
