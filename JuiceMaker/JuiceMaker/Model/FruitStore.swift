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
    
   func getStocks(of fruit: Fruit) throws -> UInt {
        guard let fruitStock = fruitStocks[fruit] else {
            throw JuiceMakerError.invaildAccess
        }
        
        return fruitStock
    }
    
    func addStock(of fruit: Fruit, count: UInt) throws {
        let fruitStock = try getStocks(of: fruit)
        
        fruitStocks[fruit] = fruitStock + count
    }

    func minusStock(of fruit: Fruit, count: UInt) throws {
        let fruitStock = try getStocks(of: fruit)
        
        guard fruitStock > count else {
            throw JuiceMakerError.invaildStockCount
        }
        
        fruitStocks[fruit] = fruitStock - count
    }
    
    func useStocks(with juiceRecipes: [JuiceRecipe]) throws {
        for (fruitName, count) in juiceRecipes {
            let fruitStock = try getStocks(of: fruitName)
            
            fruitStocks[fruitName] = fruitStock - count
        }
    }
    
    func hasEnoughStock(of recipe: JuiceRecipe) throws -> Bool {
        let (fruit, count) = recipe
        let fruitStock = try getStocks(of: fruit)
        return fruitStock > count
    }
}
