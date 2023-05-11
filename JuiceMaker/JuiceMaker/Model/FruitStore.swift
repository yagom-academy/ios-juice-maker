//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct FruitStore {
    private var stockList: [Fruit: Int] = [:]
    
    init(stockQuantity: Int = 10) {
        for fruit in Fruit.allCases {
            stockList[fruit] = stockQuantity
        }
    }
    
    mutating func decreaseIngredient(with recipe: [Ingredient]) throws {
        try checkStock(recipe)
        
        for index in recipe.indices {
            guard let currentStock = stockList[recipe[index].name] else { return }
            
            stockList[recipe[index].name] = currentStock - recipe[index].quantity
        }
    }

    private func checkStock(_ recipe: [Ingredient]) throws {
        for index in recipe.indices {
            guard let currentStock = stockList[recipe[index].name],
                  currentStock >= recipe[index].quantity
            else {
                throw FruitStoreError.outOfStock(fruit: recipe[index].name)
            }
        }
    }
}
