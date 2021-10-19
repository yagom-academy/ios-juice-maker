//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
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
        
        if fruitCounts >= requiredAmount {
            return true
        } else {
            return false
        }
    }
    
    func addStock(of fruit: Fruit, by amount: Int) {
        guard let currentStockCount = stock[fruit] else {
            return
        }
        
        let newStockCount = currentStockCount + amount
        
        stock.updateValue(newStockCount, forKey: fruit)
    }
    
    func subtractStock(of fruit: Fruit, by amount: Int) {
        guard checkEnoughStock(of: fruit, requiredAmount: amount) else {
            return
        }
        
        guard let currentStockCount = stock[fruit] else {
            return
        }
        
        let newStockCount = currentStockCount - amount
        
        stock.updateValue(newStockCount, forKey: fruit)
    }
}

