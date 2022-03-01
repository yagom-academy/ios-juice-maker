//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func make(fruitJuice: Juice) throws {
        let recipe = fruitJuice.recipe
        
        try checkEnoughStock(recipe: recipe)
        deleteStock(from: recipe)
    }
    
    private func checkEnoughStock(recipe: [Fruit: Int]) throws {
        for (fruit, amount) in recipe {
            try fruitStore.checkStock(fruit: fruit, amount: amount)
        }
    }
    
    private func deleteStock(from recipe: [Fruit: Int]) {
        for (fruit, amount) in recipe {
            fruitStore.changeStock(fruit: fruit, amount: amount)
        }
    }
}
