//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitStock: [Fruit:Int] = [:]
    
    init() {
        Fruit.allCases.forEach { fruit in
            fruitStock.updateValue(fruit.initialStock, forKey: fruit)
        }
    }
    
    func add(_ fruit: Fruit, amountOf amount: Int) {
        if let currentStock = fruitStock[fruit] {
            let totalStock = currentStock + amount
            fruitStock.updateValue(totalStock, forKey: fruit)
        }
    }
    
    func use(_ fruit: Fruit, amountOf amount: Int) {
        if let currentStock = fruitStock[fruit] {
            let totalStock = currentStock - amount
            fruitStock.updateValue(totalStock, forKey: fruit)
        }
    }
    
    func checkStock(for juice: JuiceMaker.Juice) throws {
        let recipe = juice.recipe
        for (fruit, amount) in recipe.ingredient {
            guard let currentStock = fruitStock[fruit] else {
                throw JuiceMakerError.invalidFruit
            }
            
            guard currentStock >= amount else {
                throw JuiceMakerError.outOfStock
            }
        }
    }
}
