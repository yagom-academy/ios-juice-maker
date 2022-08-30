//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    let fruitStore: FruitStore = .init(initialStock: 10)
    
    func makeJuice(of flavor: Juice) {
        let firstMaterial = flavor.recipe.first
        guard fruitStore.canSubtract(amount: firstMaterial.amount, of: firstMaterial.fruit) else {
            return
        }
        if let secondMaterial = flavor.recipe.second {
            guard fruitStore.canSubtract(amount: secondMaterial.amount, of: secondMaterial.fruit) else { return }
            fruitStore.subtract(amount: secondMaterial.amount, of: secondMaterial.fruit)
        }
        fruitStore.subtract(amount: firstMaterial.amount, of: firstMaterial.fruit)
    }
}
