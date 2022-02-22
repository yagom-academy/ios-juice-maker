//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    
    var fruits = [Fruit: Int]()
    
    init() {
        fruits = [
            .strawberry: 10,
            .banana: 10,
            .pineapple: 10,
            .kiwi: 10,
            .mango: 10
        ]
    }
    
    func canMakeJuice(recipe: [Fruit: Int]) throws {
        for (fruit, amount) in recipe {
            guard let stock = fruits[fruit], stock >= amount else {
                throw JuiceMakerError.outOfStock
            }
        }
    }
    
    func changeFruitStock(fruit: Fruit, amount: Int) {
        guard let stock = fruits[fruit] else {
            return
        }
        fruits[fruit] = stock - amount
    }
}
