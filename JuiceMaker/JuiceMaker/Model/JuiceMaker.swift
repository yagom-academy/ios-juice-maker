//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    let fruitStore = FruitStore(stock: 10)
    var stringOfFruitStock: [Fruit: String] {
        return fruitStore.fruitStock.mapValues { String($0) }
    }

    func canMake(_ seletedJuice: Menu) -> Bool {
        let recipe: [Fruit : Int] = seletedJuice.recipe
        
        guard fruitStore.isRemaining(of: recipe) else {
            return false
        }
        
        for (fruit, count) in recipe {
            fruitStore.changeQuantity(of: fruit, step: count, by: .subtraction)
        }
        return true
    }
}

