//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var fruitStock: [Fruit : Int] = [:]
    
    init(defaultStock: Int = 10) {
        for fruit in Fruit.allCases {
            fruitStock.updateValue(defaultStock, forKey: fruit)
        }
    }
    
    func bringFruitStock(_ fruit: Fruit) -> Int? {
        return fruitStock[fruit]
    }
    
    func addFruits(fruit: Fruit, amount: Int) {
        guard var fruitAmount = fruitStock[fruit] else {
            return
        }
        
        fruitAmount += amount
        fruitStock[fruit] = fruitAmount
    }
    
    func substractFruits(juice: Juice) {
        for fruit in juice.recipe {
            guard var fruitAmount = fruitStock[fruit.name] else {
                return
            }
            
            fruitAmount -= fruit.count
            fruitStock[fruit.name] = fruitAmount
        }
    }
}
