//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
final class FruitStore: StoreType {
    typealias Product = Fruit
    private(set) var fruits: [Fruit: Number] = [:]
    
    init(_ value: Int = 10) {
        for fruit in Fruit.allCases {
            self.fruits[fruit] = Number(value)
        }
    }
    
    func increase(product: Fruit, to amount: Number) throws {
        try self.fruits[product]?.increase(amount)
    }
    
    func decrease(product: Fruit, to amount: Number) throws {
        try self.fruits[product]?.decrease(amount)
    }
    
    func hasStock(of product: Fruit, to count: Number) -> Bool {
        if let stock: Number = self.fruits[product],
           stock >= count {
            return true
        }
        return false
    }
}
