//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//


// 과일 저장소 타입
class FruitStore {
    private var fruits: [Fruit : Int] = [:]
    
    private init(initalStock: Int) {
        for fruit in Fruit.allCases {
            self.fruits[fruit] = initalStock
        }
    }
    
    private func checkStock(fruit: Fruit, quantity: Int) -> Bool {
        guard let stock = fruits[fruit], stock > quantity else {
            print("\(fruit) 재고가 부족합니다.")
            return false
        }
        
        return true
    }
    
    func decreaseStock(fruits: [Fruit : Int]) -> Bool {
        for (fruit, quantity) in fruits {
            guard checkStock(fruit: fruit, quantity: quantity) else {
                return false
            }
        }
        
        for (fruit, quantity) in fruits {
            guard let stock = fruits[fruit] else {
                return false
            }
            self.fruits[fruit] = stock - quantity
        }
        
        return true
    }
}
