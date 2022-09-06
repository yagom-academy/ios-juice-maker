//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    
    func make(_ juice: Juice) -> Result<Juice, FruitStoreError> {
        let recipe = juice.recipe
        
        do {
            try FruitStore.shared.reduce(by: recipe)
        } catch {
            return .failure(FruitStoreError.insufficientInventory)
        }
        
        return .success(juice)
    }
}
