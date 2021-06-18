//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

typealias JuiceRecipe = (fruit: Fruit, count: UInt)

class FruitStore {
    var fruitStocks: [Fruit: UInt] = [:]
    static let shared: FruitStore = FruitStore.init()
    
    private init(initialValue: UInt = 10) {
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
    
    func getDoubleValueOfStocks(of fruit: Fruit) throws -> Double {
        let fruitStock = try getStocks(of: fruit)
        return Double(fruitStock)
    }
    
    func updateStock(of fruit: Fruit, count: UInt) {
        self.fruitStocks[fruit] = count
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
        return fruitStock >= count
    }
}
