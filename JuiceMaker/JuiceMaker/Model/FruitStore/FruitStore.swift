//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

protocol Fruitable {
    func count(of fruit: Fruit) -> Int?
    func add(fruit: Fruit, as amount: Int)
    func consume(fruit: Fruit, for amount: Int)
}

//MARK: 과일 저장소 타입
final class FruitStore: Fruitable {
    private var fruits: [Fruit:Int] = [:]
    
    init(initialValue: Int = 10) {
        for fruit in Fruit.allCases {
            self.fruits.updateValue(initialValue, forKey: fruit)
        }
    }
}

extension FruitStore {
    func count(of fruit: Fruit) -> Int? {
        return fruits[fruit]
    }
    
    func add(fruit: Fruit, as amount: Int) {
        fruits.updateValue((fruits[fruit] ?? 10) + amount, forKey: fruit)
    }
    
    func consume(fruit: Fruit, for amount: Int) {
        fruits.updateValue((fruits[fruit] ?? 10) - amount, forKey: fruit)
    }
}
