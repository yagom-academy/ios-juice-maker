//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    var fruits: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10,
    ]
    
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
