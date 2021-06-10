//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

typealias JuiceRecipe = (fruit: Fruit, count: UInt)

class FruitStore {
    private var fruitStocks: [Fruit: UInt] = [:]
    
    init(initialValue: UInt = 10) {
        let fruitList = Fruit.makeFruitList()
        
        for fruit in fruitList {
            self.fruitStocks[fruit] = initialValue
        }
    }
    
    func addStock(of fruit: Fruit, count: UInt) throws {
        guard let fruitCount = fruitStocks[fruit] else {
            throw JuiceMakerError.invaildAccess
        }
        
        fruitStocks[fruit] = fruitCount + count
    }
    
    func useStocks(with juiceRecipes: [JuiceRecipe]) throws {
        for (fruitName, count) in juiceRecipes {
            guard let fruitStock = fruitStocks[fruitName] else {
                throw JuiceMakerError.invaildAccess
            }
            fruitStocks[fruitName] = fruitStock - count
        }
    }
    
    func getFruitStock(of fruit: Fruit) throws -> UInt {
        guard let fruitStock = fruitStocks[fruit] else {
            throw JuiceMakerError.invaildAccess
        }
        
        return fruitStock
    }
    
    func hasEnoughStock(of recipe: JuiceRecipe) throws -> Bool {
        let (fruit, count) = recipe
        let stock = try getFruitStock(of: fruit)
        return stock > count
    }
    
}
