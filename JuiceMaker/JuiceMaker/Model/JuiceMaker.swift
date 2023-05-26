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
    
    func make(_ juice: Juice) -> Result<Juice, FruitStoreError> {
        guard canMake(juice) else {
            return .failure(FruitStoreError.outOfStock)
        }
        
        for (fruit, quantity) in juice.recipe {
            fruitStore.changeStock(of: fruit, by: -quantity)
        }
        return .success(juice)
    }
    
    private func canMake(_ juice: Juice) -> Bool {
        for (fruit, quantity) in juice.recipe {
            guard fruitStore.checkStock(of: fruit, for: quantity) else { return false }
        }
        return true
    }
    
    func getCurrentStock(of fruit: Fruit) -> Int? {
        return fruitStore.getCurrentStock(of: fruit)
    }
    
    func getFruitStore() -> FruitStore {
        return fruitStore
    }
}
