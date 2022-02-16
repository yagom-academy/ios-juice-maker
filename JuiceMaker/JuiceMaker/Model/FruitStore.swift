//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    private(set) var fruits: [Fruit: Int] = [:]
    
    init(_ value: Int = 10) {
        for fruit in Fruit.allCases {
            self.fruits[fruit] = value
        }
    }
    
    func increase(fruit: Fruit, to amount: Int) {
        guard amount >= 0 else {
            return
        }
        self.fruits[fruit, default: 0] += amount
    }
    
    func decrease(fruit: Fruit, to amount: Int) {
        guard amount >= 0 else {
            return
        }
        self.fruits[fruit, default: 0] -= amount
    }
    
    func hasStock(of fruit: Fruit, to count: Int) -> Bool {
        guard self.fruits[fruit, default: 0] >= count else {
            return false
        }
        return true
    }
}
