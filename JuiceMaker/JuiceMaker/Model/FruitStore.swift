//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var stockList: [Fruit: Int] = [:]
    
    init(stockQuantity: Int = 10) {
        for fruit in Fruit.allCases {
            stockList[fruit] = stockQuantity
        }
    }
    
    func decreaseIngredient(with recipe: [Ingredient] ) throws {
        try inspectStock(recipe)
        
        for index in recipe.indices {
            guard let currentStock = stockList[recipe[index].name] else { return }
            
            stockList[recipe[index].name] = currentStock - recipe[index].quantity
        }
    }

    private func inspectStock(_ recipe: [Ingredient]) throws {
        for index in recipe.indices {
            guard let currentStock = stockList[recipe[index].name],
                  currentStock >= recipe[index].quantity
            else {
                throw FruitStoreError.shortageOfStock(fruit: recipe[index].name)
            }
        }
    }
}
