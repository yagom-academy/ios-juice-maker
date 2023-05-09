//
//  JuiceMaker - JuiceMaker.swift
//  Created by Karen, myungsun.
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    private func canProduceJuice(_ juice: Juice) -> Bool {
        for (fruit, amount) in juice.recipe {
            if fruitStore.getCurrentStock(of: fruit) < amount {
                return false
            }
        }
        return true
    }
}
