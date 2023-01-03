//
//  JuiceMaker - FruitStore.swift
//  Created by Harry, kokkilE. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    static let shared = FruitStore()
    
    private var fruitStock: [Fruit: Int]
    
    private init() {
        fruitStock = [
            .strawberry: 10,
            .banana: 10,
            .pineapple: 10,
            .kiwi: 10,
            .mango: 10
        ]
    }
    
    func addStock(fruit: Fruit, quantity: Int) throws {
        guard let selectedFruitStock = fruitStock[fruit] else {
            throw FruitStoreError.invalidFruitInput
        }
        
        fruitStock.updateValue(selectedFruitStock + quantity, forKey: fruit)
    }
    
    func subtractStock(fruit: Fruit, quantity: Int) throws {
        guard let selectedFruitStock = fruitStock[fruit] else {
            throw FruitStoreError.invalidFruitInput
        }
        
        guard selectedFruitStock >= quantity else {
            throw FruitStoreError.belowZeroQuantity
        }
        
        fruitStock.updateValue(selectedFruitStock - quantity, forKey: fruit)
    }
    
    func isStocked(recipe: [Fruit: Int]) throws -> Bool {
        for ingredient in recipe {
            guard let currentStock = fruitStock[ingredient.key] else {
                throw FruitStoreError.invalidFruitInput
            }
            
            if currentStock < ingredient.value {
                return false
            }
        }
        
        return true
    }
}


