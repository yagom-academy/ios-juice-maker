//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

protocol Store {
    mutating func increase(in fruit: Fruit) throws
    mutating func decrease(in fruit: Fruit) throws
    mutating func makeDrink(of ingredients: [Ingredient]) throws
}

struct FruitStore: Store {

    private var inventory: [Fruit: Int]
    
    init(value: Int = 10) {
        inventory = Fruit.allCases.reduce(into: [:]) { stock, fruit in
            stock[fruit] = value
        }
    }
    
    mutating func increase(in fruit: Fruit) throws {
        guard let value = inventory[fruit] else {
            throw JuiceMakerError.notFindFruit
        }
        
        self.inventory[fruit] = value + 1
    }
    
    mutating func decrease(in fruit: Fruit) throws {
        guard let value = inventory[fruit] else {
            throw JuiceMakerError.notFindFruit
        }
        
        guard value > 0 else {
            throw JuiceMakerError.notDecrease
        }
        
        self.inventory[fruit] = value - 1
    }
    
    mutating func makeDrink(of ingredients: [Ingredient]) throws {
        try checkStock(of: ingredients)
        try startMakingJuice(of: ingredients)
    }
    
    private func checkStock(of ingredients: [Ingredient]) throws {
        try ingredients.forEach { ingredient in
            try isEnough(of: ingredient)
        }
    }
    
    private func isEnough(of ingredient: Ingredient) throws {
        let fruit = ingredient.fruit
        let number = ingredient.number
        
        guard let value = inventory[fruit], value - number >= 0 else {
            throw JuiceMakerError.notEnough
        }
    }
    
    mutating private func startMakingJuice(of ingredients: [Ingredient]) throws {
        try ingredients.forEach { ingredient in
            try use(ingredient)
        }
    }
    
    mutating private func use(_ ingredient: Ingredient) throws {
        let fruit = ingredient.fruit
        let number = ingredient.number
        
        guard let value = inventory[fruit] else {
            throw JuiceMakerError.notFindFruit
        }
        
        self.inventory[fruit] = value - number
    }
}
