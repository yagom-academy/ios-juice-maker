//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
  
    private var stock: [Fruit: Int]
    
    init(initialStockCount: Int = 10) {
        let fruits = Fruit.allCases
        let fruitsCount = Array(repeating: initialStockCount, count: fruits.count)
        
        stock = Dictionary(uniqueKeysWithValues: zip(fruits, fruitsCount))
    }
    
    func checkEnoughStock(of fruit: Fruit, requiredAmount: Int) -> Bool {
        guard let fruitCounts = stock[fruit] else {
            return false
        }
        
        guard fruitCounts >= requiredAmount else {
            return false
        }
        
        return true
    }
    
    func addStock(of fruit: Fruit, by amount: Int) throws {
        guard let currentStockCount = stock[fruit] else {
            throw JuiceMakeError.invaildKey
        }
        
        let newStockCount = currentStockCount + amount
        
        stock.updateValue(newStockCount, forKey: fruit)
    }
    
    func subtractStock(of fruit: Fruit, by amount: Int) throws {
        guard let currentStockCount = stock[fruit] else {
            throw JuiceMakeError.invaildKey
        }
        
        guard checkEnoughStock(of: fruit, requiredAmount: amount) else {
            throw JuiceMakeError.notEnoughStock
        }
        
        let newStockCount = currentStockCount - amount
        
        stock.updateValue(newStockCount, forKey: fruit)
    }
}

