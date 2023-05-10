//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private(set) var stockList: [Fruit: Int] = [:]
    
    init(stockQuantity: Int = 10) {
        for fruit in Fruit.allCases {
            stockList[fruit] = stockQuantity
        }
    }
    
    func decreaseIngredient(with recipe: [(fruit: Fruit, quantity: Int)]) throws {
        try inspectStock(recipe)
        
        for index in recipe.indices {
            guard let currentStock = stockList[recipe[index].fruit] else { return }
            
            stockList[recipe[index].fruit] = currentStock - recipe[index].quantity
        }
    }

    private func inspectStock(_ recipe: [(fruit: Fruit, quantity: Int)]) throws {
        for index in recipe.indices {
            guard let currentStock = stockList[recipe[index].fruit], currentStock >= recipe[index].quantity else {
                throw FruitStoreError.shortageOfStock(fruit: recipe[index].fruit)
            }
        }
    }
}
