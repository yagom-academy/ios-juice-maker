//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

typealias JuiceRecipe = (fruitName: Fruit, count: UInt)

class FruitStore {
    var fruitStocks: [Fruit: Int] = [:]
    
    init(initialValue: Int = 10) {
        let fruitList = Fruit.makeFruitList()
        
        for fruit in fruitList {
            self.fruitStocks[fruit] = initialValue
        }
    }
    
    func addStock(fruitName: Fruit, count: Int) throws {
        guard let fruitCount = fruitStocks[fruitName] else {
            throw JuiceMakerError.invaildAccess
        }
        
        let totalCount = fruitCount + count
        
        guard totalCount >= 0 else {
            throw JuiceMakerError.invaildStockCount
        }
        
        fruitStocks[fruitName] = totalCount
    }
    
    func useStocks(with juiceRecipes: [JuiceRecipe]) throws {
        for (fruitName, count) in juiceRecipes {
            guard let fruitStock = fruitStocks[fruitName] else {
                throw JuiceMakerError.invaildAccess
            }
            fruitStocks[fruitName] = fruitStock - Int(count)
        }
    }
    
    func getFruitStock(on juice: Fruit) throws -> Int {
        guard let fruitStock = fruitStocks[juice] else {
            throw JuiceMakerError.invaildAccess
        }
        
        return fruitStock
    }
    
    func hasEnoughStock(of recipe: JuiceRecipe) throws -> Bool {
        let (fruitName, count) = recipe
        let stock = try getFruitStock(on: fruitName)
        return stock > count
    }
    
}
