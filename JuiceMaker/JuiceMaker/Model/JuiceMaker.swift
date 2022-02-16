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
        let recipe: Recipe = juice.recipe()
        
        for material in recipe.materials where !self.fruitStore.isAvailable(fruit: material.fruit,
                                                                            of: material.count) {
            throw JuiceMakerError.outOfStock
        }
        
        for material in recipe.materials {
            self.fruitStore.decrease(fruit: material.fruit, to: material.count)
        }
    }
}
