//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//


struct JuiceMaker {
    private var fruitStore: FruitStore
    
    init(fruitsBaseQuantity: Int) {
        fruitStore = FruitStore(baseQuantity: fruitsBaseQuantity)
    }
    
    private func verifyIngredientsOf(recipe: [Fruit: Int]) throws {
        for (fruit, quantity) in recipe {
            do {
                try fruitStore.hasEnough(fruit: fruit, quantity: quantity)
            } catch {
                throw JuiceMakerError.insufficientIngredients
            }
        }
    }
    
    func make(juice: Juice) throws {
        let juiceRecipe = juice.recipe
        
        try verifyIngredientsOf(recipe: juiceRecipe)
        
        for (fruit, quantity) in juiceRecipe {
            try? fruitStore.use(fruit: fruit, quantity: quantity)
        }
    }
}
