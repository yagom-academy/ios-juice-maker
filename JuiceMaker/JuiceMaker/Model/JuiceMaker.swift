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
    
    private func verifyIngredients(of recipe: [Fruit: Int]) throws {
        for (fruit, quantity) in recipe {
            do {
                try fruitStore.hasEnough(fruit: fruit, quantity: quantity)
            } catch {
                throw JuiceMakerError.insufficientIngredients
            }
        }
    }
    
    func makeJuice(_ juice: Juice) throws {
        let juiceRecipe = juice.recipe
        
        try verifyIngredients(of: juiceRecipe)
        
        for (fruit, quantity) in juiceRecipe {
            try? fruitStore.useFruit(fruit, quantity: quantity)
        }
    }
}
