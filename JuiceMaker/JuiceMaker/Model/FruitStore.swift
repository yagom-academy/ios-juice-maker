//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

protocol Store {
    mutating func checkStock(of ingredients: [Ingredient]) -> Bool
    mutating func makeDrink(of ingredients: [Ingredient])
}

struct FruitStore: Store {

    private var inventory: [Fruit: Int]
    
    init(value: Int = 10) {
        inventory = Fruit.allCases.reduce(into: [:]) { stock, fruit in
            stock[fruit] = value
        }
    }
    
    mutating func makeDrink(of ingredients: [Ingredient]) {
        startMakingJuice(of: ingredients)
    }
    
    mutating func checkStock(of ingredients: [Ingredient]) -> Bool {
        for ingredient in ingredients where !hasStock(of: ingredient) {
            return false
        }
        
        return true
    }
    
    private func hasStock(of ingredient: Ingredient) -> Bool {
        let fruit = ingredient.fruit
        let number = ingredient.number

        guard let value = inventory[fruit], value - number >= 0 else {
            return false
        }
        
        return true
    }
    
    mutating private func startMakingJuice(of ingredients: [Ingredient]) {
        ingredients.forEach { ingredient in
            makeJuice(in: ingredient.fruit, number: ingredient.number)
        }
    }

    mutating private func makeJuice(in fruit: Fruit, number: Int)  {
        guard let value = inventory[fruit] else {
            return
        }
        
        self.inventory[fruit] = value - number
    }
}
