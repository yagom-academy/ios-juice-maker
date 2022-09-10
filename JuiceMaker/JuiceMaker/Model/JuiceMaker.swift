//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    private(set) var fruitStore = FruitStore()
    
    func make(_ juice: Juice) -> Result<Juice, FruitStoreError> {
        let recipe = juice.recipe
        
        do {
            try fruitStore.reduce(by: recipe)
        } catch {
            return .failure(FruitStoreError.insufficientInventory)
        }
        
        return .success(juice)
    }
}
