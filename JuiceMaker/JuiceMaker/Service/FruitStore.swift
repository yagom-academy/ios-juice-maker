//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore {
    private(set) var fruits: [Fruit: Number] = [:]
    
    init(_ value: Int = 10) {
        for fruit in Fruit.allCases {
            self.fruits[fruit] = Number(value)
        }
    }
    
    func changeFruitStock(fruit: Fruit, to amount: Number) {
        self.fruits[fruit] = amount
    }
    
    func increase(fruit: Fruit, to amount: Number) throws {
        try self.fruits[fruit]?.increase(amount)
    }
    
    func decrease(fruit: Fruit, to amount: Number) throws {
        try self.fruits[fruit]?.decrease(amount)
    }
    
    func hasStock(of fruit: Fruit, to count: Number) -> Bool {
        if let stock: Number = self.fruits[fruit],
           stock >= count {
            return true
        }
        return false
    }
}
