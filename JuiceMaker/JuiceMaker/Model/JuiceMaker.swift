//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func make(fruitJuice: Juice) {
        let recipe = fruitJuice.recipe
        if canMake(juice: fruitJuice) {
            deleteStockFrom(recipe: recipe)
        }
    }
    
    func canMake(juice: Juice) -> Bool {
        let recipe = juice.recipe
        for (fruit, amount) in recipe {
            if fruitStore.checkStock(fruit: fruit, amount: amount) == false {
                return false
            }
        }
        return true
    }
    
    func deleteStockFrom(recipe: [Fruit: Int]) {
        for (fruit, amount) in recipe {
            fruitStore.changeStock(fruit: fruit, amount: amount)
        }
    }
}
