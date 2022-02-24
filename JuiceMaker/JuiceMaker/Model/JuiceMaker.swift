//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(fruitJuice: Juice) {
        let recipe = fruitJuice.recipe
        deleteStockFromRecipeRequired(recipe: recipe)
    }
    
    func deleteStockFromRecipeRequired(recipe: [Fruit: Int]) {
        for (fruit, amount) in recipe {
            fruitStore.changeFruitStock(fruit: fruit, amount: amount)
        }
    }
}
