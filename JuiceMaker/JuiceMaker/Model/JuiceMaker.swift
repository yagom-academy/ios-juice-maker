//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

//import Foundation

struct JuiceMaker {
    let fruitStore: FruitStore
    
    private func checkStock(of juice: Juice) throws {
        let recipe = juice.recipes
        
        for (fruit, amount) in recipe {
            guard try fruitStore.takeOutStock(fruit: fruit) >= amount else {
                throw StockError.notEnoughStock
            }
        }
    }
    
    private func consumeStock(with juice: Juice) throws {
        let recipes = juice.recipes
        
        for (fruit, amount) in recipes {
            guard try fruitStore.takeOutStock(fruit: fruit) >= amount else {
                throw StockError.notEnoughStock
            }
            
            try fruitStore.decreaseStock(from: fruit, by: amount)
        }
    }
}
