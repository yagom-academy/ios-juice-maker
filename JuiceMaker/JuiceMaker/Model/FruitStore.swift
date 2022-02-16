//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct FruitStore {
    private var fruits: [Fruit: Int]
    
    mutating func increase(in fruit: Fruit) throws {
        guard let value = fruits[fruit] else {
            throw JuiceMakerError.notFindFruit
        }
        
        self.fruits[fruit] = value + 1
    }
    
    mutating func decrease(in fruit: Fruit) throws {
        guard let value = fruits[fruit] else {
            throw JuiceMakerError.notFindFruit
        }
        
        guard value > 0 else {
            throw JuiceMakerError.notDecrease
        }
        
        self.fruits[fruit] = value - 1
    }
    
    private func isEnough(of ingredient: Ingredient) throws {
        let fruit = ingredient.fruit
        let number = ingredient.number
        
        guard let value = fruits[fruit], value - number >= 0 else {
            throw JuiceMakerError.notEnough
        }
    }
    
    func takeOrder(of ingredients: [Ingredient]) throws {
        try ingredients.forEach { ingredient in
            try isEnough(of: ingredient)
        }
    }
}
