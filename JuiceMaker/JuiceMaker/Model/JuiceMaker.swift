//
//  JuiceMaker - JuiceMaker.swift
//  Created by dasan & kyungmin.
//  Copyright © yagom academy. All rights reserved.
// 

enum JuiceMakerError: Error {
    case outOfFruitStock
    case unknownError
}

struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore(initialStock: 10)
    
    func blendFruitJuice(menu fruitJuice: Juice) throws {
        try requestFruitStock(menu: fruitJuice)
        receiveFruitStock(menu: fruitJuice)
    }
    
    private func requestFruitStock(menu fruitJuice: Juice) throws {
        var isEnoughStock: Bool = true
        
        fruitJuice.recipe.forEach {
            isEnoughStock = fruitStore.hasEnoughStock(fruit: $0.key, amount: $0.value) && isEnoughStock
        }
        
        if isEnoughStock == false {
            throw JuiceMakerError.outOfFruitStock
        }
    }
    
    private func receiveFruitStock(menu fruitJuice: Juice) {
        fruitJuice.recipe.forEach {
            fruitStore.reduceStock(fruit: $0.key, amount: $0.value)
        }
    }
}
      
