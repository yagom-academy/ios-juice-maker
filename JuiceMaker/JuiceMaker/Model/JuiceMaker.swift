//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func make(juice menu: JuiceMenu) throws {
        let availableIngredients = try validIngredients(by: menu.recipe)
        
        try availableIngredients.forEach {
            try fruitStore.useStock(of: $0.fruit, amount: $0.amount)
        }
    }
    
    private func validIngredients(by recipe: [Ingredient]) throws -> [Ingredient] {
        let availableIngredients = try recipe.map { ingredient in
            let fruitStock = try fruitStore.receiveStock(of: ingredient.fruit)
            
            guard fruitStock - ingredient.amount >= 0 else {
                throw JuiceError.shortageFruitStock
            }
            
            return ingredient
        }
        
        return availableIngredients
    }
}
