//
//  JuiceMaker - FruitStore.swift
//  Created by Harry, kokkilE. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    static let shared = FruitStore()
    
    var fruitStock: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ]
    
    private init() {}
    
    func addStock(fruit: Fruit, amount: Int) throws {
        guard let selectedFruitStock = fruitStock[fruit] else {
            throw FruitStoreError.invalidFruitInput
        }
        
        fruitStock.updateValue(selectedFruitStock + amount, forKey: fruit)
    }
    
    func subtractStock(fruit: Fruit, amount: Int) throws {
        guard let selectedFruitStock = fruitStock[fruit] else {
            throw FruitStoreError.invalidFruitInput
        }
        
        guard selectedFruitStock >= amount else {
            throw FruitStoreError.belowZeroAmount
        }
        
        fruitStock.updateValue(selectedFruitStock - amount, forKey: fruit)
    }
    
    func isStocked(recipe: [Fruit: Int]) -> Bool {
        for ingredient in recipe {
            guard let currentStock = fruitStock[ingredient.key] else {
                return false
            }
            
            if currentStock < ingredient.value {
                return false
            }
        }
        
        return true
    }
}


