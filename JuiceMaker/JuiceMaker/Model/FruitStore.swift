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
        for (fruit, number) in recipe {
            guard let count = fruits[fruit], count >= number else {
                throw JuiceMakerError.outOfStock
            }
        }
    }
    
    func changeFruitStock(fruit: Fruit, number: Int) {
        guard let option = fruits[fruit] else {
            return
        }
        fruits[fruit] = option - number
    }
}
