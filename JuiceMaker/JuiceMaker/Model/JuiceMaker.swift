//
//  JuiceMaker - JuiceMaker.swift
//  Created by dasan & kyungmin.
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    let fruitStore = FruitStore(initialStock: 10)
    
    func blendFruitJuice(menu fruitJuice: Juice) throws {
        try requestFruitStock(menu: fruitJuice)
        receiveFruitStock(menu: fruitJuice)
    }
    
    private func requestFruitStock(menu fruitJuice: Juice) throws {
        for ingredient in fruitJuice.recipe {
            guard fruitStore.hasEnoughStock(fruit: ingredient.fruit, amount: ingredient.amount) else {
                throw JuiceMakerError.outOfFruitStock
            }
        }
    }
    
    private func receiveFruitStock(menu fruitJuice: Juice) {
        fruitJuice.recipe.forEach {
            fruitStore.reduceStock(fruit: $0.fruit, amount: $0.amount)
        }
    }
}
      
