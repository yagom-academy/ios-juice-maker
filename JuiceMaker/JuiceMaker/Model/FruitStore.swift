//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    private var fruitStock = [Fruit: Int]()
    
    init() {
        let initialStock = 10
        
        for fruit in Fruit.allCases {
            fruitStock[fruit] = initialStock
        }
    }
    
    func checkStock(fruit: Fruit, amount: Int) -> Bool {
        guard let stock = fruitStock[fruit], stock >= amount else {
            return false
        }
        return true
    }
    
    func changeStock(fruit: Fruit, amount: Int) {
        guard let stock = fruitStock[fruit] else {
            return
        }
        fruitStock[fruit] = stock - amount
    }
}
