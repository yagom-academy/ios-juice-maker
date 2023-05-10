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
            guard let currentStock = fruitStore.getCurrentStock(of: fruit) else { return false }
            
            if currentStock < amount {
                return false
            }
        }
        return true
    }
    
    func make(_ juice: Juice) throws -> Juice? {
        if canMake(juice) {
            for (fruit, amount) in juice.recipe {
                try fruitStore.changeStock(of: fruit, by: -amount)
            }
            return juice
        }
        return nil
    }
}
