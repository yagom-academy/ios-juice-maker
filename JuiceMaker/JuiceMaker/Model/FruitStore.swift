//
//  JuiceMaker - FruitStore.swift
//  Created by Harry, kokkilE. 
//  Copyright © yagom academy. All rights reserved.
//

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
    
    func getStockCountToString(of fruit: Fruit) -> String? {
        guard let count = fruitStock[fruit] else {
            return nil
        }
        
        return String(count)
    }
    
    func addStock(fruit: Fruit, quantity: Int) throws {
        guard let selectedFruitStock = fruitStock[fruit] else {
            throw JuiceMakerError.nonExistentFruit
        }
        
        fruitStock.updateValue(selectedFruitStock + quantity, forKey: fruit)
    }
    
    func subtractStock(fruit: Fruit, quantity: Int) throws {
        guard let selectedFruitStock = fruitStock[fruit] else {
            throw JuiceMakerError.nonExistentFruit
        }
        
        fruitStock.updateValue(selectedFruitStock - quantity, forKey: fruit)
    }
    
    func isStocked(for juice: Juice) throws -> Bool {
        for ingredient in juice.recipe {
            guard let currentStock = fruitStock[ingredient.key] else {
                throw JuiceMakerError.nonExistentFruit
            }
            
            if currentStock < ingredient.value {
                return false
            }
        }
        
        return true
    }
}


