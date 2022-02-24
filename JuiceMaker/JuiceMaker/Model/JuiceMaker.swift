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
        deleteStockFrom(recipe: recipe)
    }
    
    func deleteStockFrom(recipe: [Fruit: Int]) {
        for (fruit, amount) in recipe {
            fruitStore.changeStock(fruit: fruit, amount: amount)
        }
    }
}
