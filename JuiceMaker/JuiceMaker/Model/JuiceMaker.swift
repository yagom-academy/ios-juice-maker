//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore: FruitStore
    
    func makeJuice(of juice: Juice) {
        for material in juice.recipe {
            guard fruitStore.canSubtract(amount: material.amount, of: material.fruit) else {
                return
            }
        }
        for material in juice.recipe {
            fruitStore.subtract(amount: material.amount, of: material.fruit)
        }
    }
}
