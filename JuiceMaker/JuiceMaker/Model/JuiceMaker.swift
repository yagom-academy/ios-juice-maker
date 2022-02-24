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
        if canMake(juice: fruitJuice) {
            deleteStockFromRecipeRequired(recipe: recipe)
        }
    }
    
    func canMake(juice: Juice) -> Bool {
        let recipe = juice.recipe
        for (fruit, amount) in recipe {
            if fruitStore.haveEnough(fruit: fruit, amount: amount) == false {
                return false
            }
        }
        return true
    }
    
    func deleteStockFromRecipeRequired(recipe: [Fruit: Int]) {
        for (fruit, amount) in recipe {
            fruitStore.changeFruitStock(fruit: fruit, amount: amount)
        }
    }
}
