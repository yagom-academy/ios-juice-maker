//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//


struct JuiceMaker {
    private func verifyIngredients(of recipe: [Fruit: Int]) throws {
        for (fruit, quantity) in recipe {
            try FruitStore.shared.verifySingleFruitExistsEnough(fruit: fruit, quantity: quantity)
        }
    }
    
    func makeJuice(_ juice: Juice) throws {
        let juiceRecipe = juice.recipe
        
        try verifyIngredients(of: juiceRecipe)
        
        for (fruit, quantity) in juiceRecipe {
            try FruitStore.shared.subtractFruit(fruit, quantity: quantity)
        }
    }
}
