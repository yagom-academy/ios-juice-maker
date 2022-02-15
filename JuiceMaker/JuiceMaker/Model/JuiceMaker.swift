//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(_ juice: Juice) throws {
        let recipe: [(fruit: Fruit, count: Int)] = juice.recipe()
        
        for item in recipe where !self.fruitStore.isAvailable(fruit: item.fruit,
                                                              of: item.count) {
            throw JuiceMakerError.outOfStock
        }
        
        for item in recipe {
            self.fruitStore.decrease(fruit: item.fruit, to: item.count)
        }
    }
}
