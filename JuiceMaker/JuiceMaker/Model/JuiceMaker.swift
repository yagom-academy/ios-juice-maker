//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    func make(juice: Juice) throws {
        do {
            let recipe = juice.recipe
            
            try recipe.forEach { (fruit: Fruit, amount: Int) in
                try fruitStore.reduceInventory(of: fruit, by: amount)
            }
            
        } catch {
            throw FruitStoreError.insufficientInventory
        }
    }
}
