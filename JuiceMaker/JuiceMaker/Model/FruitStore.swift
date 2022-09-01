//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private let initialStock = 10
    private var fruitStock = [Fruit: Int]()
    
    init() {
        Fruit.allCases.forEach { fruit in
            fruitStock[fruit] = initialStock
        }
    }
    
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
