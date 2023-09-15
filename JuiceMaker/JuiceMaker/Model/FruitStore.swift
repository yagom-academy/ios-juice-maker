//
//  JuiceMaker - FruitStore.swift
//  Created by Kiseok, 쥬봉이.
//  Copyright © yagom academy. All rights reserved.
//


// 과일 저장소 타입
class FruitStore {
    static let shared = FruitStore(initialStock: 10)
    private var fruits: [Fruit: Int] = [:]
    
    private init(initialStock: Int) {
        for fruit in Fruit.allCases {
            self.fruits[fruit] = initialStock
        }
    }
    
    private func isValidStock(recipe: [Fruit: Int]) -> Bool {
        for (fruit, quantity) in recipe {
            guard let stock = fruits[fruit], stock >= quantity else {
                print("\(fruit) 재고가 부족합니다.")
//                print("\(fruit)의 재고가 \(String(describing: fruits[fruit]))개 남음")
                return false
            }
        }
        return true
    }
    
    func isDecreasedStock(recipe: [Fruit: Int]) -> Bool {
        guard isValidStock(recipe: recipe) else {
            return false
        }
        
        for (fruit, quantity) in recipe {
            guard let stock = fruits[fruit] else {
                return false
            }
            fruits[fruit] = stock - quantity
//            print("\(fruit)의 재고가 \(String(describing: fruits[fruit]))개 남음")
        }
        
        return true
    }
}

