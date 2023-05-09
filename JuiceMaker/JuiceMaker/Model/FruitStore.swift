//
//  JuiceMaker - FruitStore.swift
//  Created by Karen, myungsun.
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    private var fruitInventory: [Fruit: Int] = Dictionary<Fruit, Int>()
    
    init(stock: Int = 10) {
        Fruit.allCases.forEach {
            fruitInventory[$0] = stock
        }
    }
}
