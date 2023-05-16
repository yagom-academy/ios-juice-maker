//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private(set) var fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    private func canMake(_ juice: Juice) -> Bool {
        for (fruit, amount) in juice.recipe {
            guard fruitStore.checkStock(of: fruit, for: amount) else { return false }
        }
        return true
    }
    
    func make(_ juice: Juice) -> Result<Juice, FruitStoreError> {
        let result = canMake(juice)
        
        if canMake(juice) {
            for (fruit, amount) in juice.recipe {
                fruitStore.changeStock(of: fruit, by: -amount)
            }
            return .success(juice)
        }
        return .failure(FruitStoreError.outOfStock)
    }
}
