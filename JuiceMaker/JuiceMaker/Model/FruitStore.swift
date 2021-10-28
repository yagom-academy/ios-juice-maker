//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    private var stockOfFruit: [Fruit: Int] = [:]
    
    init() {
        for fruit in Fruit.allCases {
            stockOfFruit[fruit] = Fruit.initialValue
        }
    }
    
    private func hasEnoughStock(of fruit: Fruit, count: Int) -> Bool {
        guard let fruitAmount = stockOfFruit[fruit],
              fruitAmount >= count else {
                  return false
              }
        return true
    }
    
    func subtractStock(of fruit: Fruit, amount: Int) {
            if let stock = stockOfFruit[fruit] {
                stockOfFruit[fruit] = stock - amount
            }
    }
    
    func consumeFruits(firstFruit: Fruit, firstFruitAmount: Int, secondFruit: Fruit? = nil, secondFruitAmount: Int? = nil) {
        guard hasEnoughStock(of: firstFruit, count: firstFruitAmount) else {
            return
        }
        
        guard let secondFruit = secondFruit,
           let secondFruitAmount = secondFruitAmount else {
               subtractStock(of: firstFruit, amount: firstFruitAmount)
               return
        }
        guard hasEnoughStock(of: secondFruit, count: secondFruitAmount) else {
            return
        }
        
        subtractStock(of: firstFruit, amount: firstFruitAmount)
        subtractStock(of: secondFruit, amount: secondFruitAmount)
    }
}
