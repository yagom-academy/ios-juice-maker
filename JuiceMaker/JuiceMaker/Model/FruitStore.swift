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
    
    private func checkEnoughStock(of fruit: Fruit, requiredAmount: Int) throws -> Bool {
        guard let currentStockCount = stock[fruit] else {
            throw SystemError.invaildKey
        }
        
        guard currentStockCount >= requiredAmount else {
            throw ServiceError.notEnoughStock
        }
        
        return true
    }
    
    func addStock(of fruit: Fruit, by amount: Int) throws {
        guard let currentStockCount = stock[fruit] else {
            throw SystemError.invaildKey
        }
        
        let newStockCount = currentStockCount + amount
        
        stock.updateValue(newStockCount, forKey: fruit)
    }
    
    func subtractStock(of fruit: Fruit, by amount: Int) throws {
        guard let currentStockCount = stock[fruit] else {
            throw SystemError.invaildKey
        }
        
        let newStockCount = currentStockCount - amount
        
        stock.updateValue(newStockCount, forKey: fruit)
    }
    
    private func checkAvailableFruits(of requiredFruits: [Fruit:Int]) throws -> Bool {
        let availableFruits = try requiredFruits.filter { (fruit, amount) in
            try checkEnoughStock(of: fruit, requiredAmount: amount)
        }
        
        guard availableFruits.count == requiredFruits.count else {
            return false
        }
        
        return true
    }
    
    func consumeFruits(of requiredFruits: [Fruit:Int]) throws {
        guard try checkAvailableFruits(of: requiredFruits) else {
            return
        }
        
        for (fruit, amount) in requiredFruits {
            try subtractStock(of: fruit, by: amount)
        }
    }
}

