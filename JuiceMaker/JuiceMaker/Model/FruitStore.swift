//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    var fruits: [Fruit : Int] = [:]

    init() {
        Fruit.allCases.forEach {
            fruits[$0] = 10
        }
    }
    
    init(stock: Int) {
        Fruit.allCases.forEach {
            fruits[$0] = stock
        }
    }
    
    func add(fruit: Fruit, amount: Int) {
        guard let stock = fruits[fruit] else {
            return
        }
        
        fruits.updateValue(stock + amount, forKey: fruit)
    }
    
    func subtract(fruit: Fruit, amount: Int) {
        guard let stock = fruits[fruit] else {
            return
        }
        
        fruits.updateValue(stock - amount, forKey: fruit)
    }
}
