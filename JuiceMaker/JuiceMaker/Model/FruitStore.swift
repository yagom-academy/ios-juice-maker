//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    private var fruits = [Fruit: Int]()
    
    init() {
        let initialStock = 10
        
        for fruit in Fruit.allCases {
            fruits[fruit] = initialStock
        }
    }
    
    func haveEnough(fruit: Fruit, amount: Int) -> Bool {
        guard let stock = fruits[fruit], stock >= amount else {
            return false
        }
        return true
    }
    
    func changeFruitStock(fruit: Fruit, amount: Int) {
        guard let stock = fruits[fruit] else {
            return
        }
        fruits[fruit] = stock - amount
    }
}
