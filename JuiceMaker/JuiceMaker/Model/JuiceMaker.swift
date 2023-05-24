//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore: FruitStore
    
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
        if canMake(juice) {
            for (fruit, amount) in juice.recipe {
                fruitStore.changeStock(of: fruit, by: -amount)
            }
            return .success(juice)
        }
        return .failure(FruitStoreError.outOfStock)
    }
    
    func getCurrentStock(of fruit: Fruit) -> Int? {
        return fruitStore.getCurrentStock(of: fruit)
    }
    
    func getFruitStore() -> FruitStore {
        return fruitStore
    }
}
