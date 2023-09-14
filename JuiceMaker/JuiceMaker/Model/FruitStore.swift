//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//


// 과일 저장소 타입
struct FruitStore {
    private var fruits: [Fruit: Int] = [:]
    
    init(initialStock: Int) {
        for fruit in Fruit.allCases {
            self.fruits[fruit] = initialStock
        }
    }
    
    private func checkStock(fruit: Fruit, quantity: Int) -> Bool {
        guard let stock = fruits[fruit], stock > quantity else {
            print("\(fruit) 재고가 부족합니다.")
            return false
        }
        
        return true
    }
    
    mutating func decreaseStock(fruitsInStore: [Fruit: Int]) -> Bool {
        for (fruit, quantity) in fruitsInStore {
            guard checkStock(fruit: fruit, quantity: quantity) else {
                return false
            }
        }
        
        for (fruit, quantity) in fruitsInStore {
            guard let stock = fruits[fruit] else {
                return false
            }
            fruits[fruit] = stock - quantity
        }
        
        return true
    }
}

