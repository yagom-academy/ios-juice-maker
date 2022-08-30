//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruitStock: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func addStock(of fruit: Fruit, amount: Int) {
        if let currentStock = fruitStock[fruit] {
            let totalStock = currentStock + amount
            fruitStock.updateValue(totalStock, forKey: fruit)
        }
    }
    
    func useStock(of fruit: Fruit, amount: Int) {
        if let currentStock = fruitStock[fruit] {
            let totalStock = currentStock - amount
            fruitStock.updateValue(totalStock, forKey: fruit)
        }
    }
    
    func checkStock(for juice: JuiceMaker.Menu) throws {
        let recipes = juice.recipe
        for recipe in recipes {
            guard let currentStock = fruitStock[recipe.fruit],
                      currentStock >= recipe.amount
            else {
                throw JuiceMakerError.outOfStock
            }
        }
    }
}
