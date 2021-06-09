//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

typealias JuiceRecepe = (fruitName: Fruit, count: UInt)

class FruitStore {
    
    var fruitStocks: [Fruit: Int] = [:]
    
    init(initialValue: Int = 10) {
        let fruitList = Fruit.makeFruitList()
        for fruit in fruitList {
            self.fruitStocks[fruit] = initialValue
        }
    }
    
    func addStock(fruitName: Fruit, count: Int) {
        guard let fruitCount = fruitStocks[fruitName] else {
            // Alert
            return
        }
        
        let totalCount = fruitCount + count
        guard totalCount >= 0 else {
            // throw
            return
        }
        
        fruitStocks[fruitName] = totalCount
    }
    
    func useStocks(with juiceRecipes: [JuiceRecepe]) {
        for (fruitName, count) in juiceRecipes {
            guard let fruitStock = fruitStocks[fruitName] else {
                // 올바르지 않은 접근에 대한 알럿.
                return
            }
            // 재고 차감 로직.
            fruitStocks[fruitName] = fruitStock - Int(count)
        }
    }
}
