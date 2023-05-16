//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    var fruitStore: FruitStore = FruitStore()
    
    mutating func makeOrder(_ juice: Juice) throws {
        for ingredient in juice.recipe {
            try fruitStore.checkStock(witch: ingredient.name, by: ingredient.quantity)
        }
        
        juice.recipe.forEach { fruitStore.decreaseStock(witch: $0.name, by: $0.quantity) }
    }
}
