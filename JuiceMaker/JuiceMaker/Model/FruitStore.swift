//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    class Fruit {
        var stock = 10
    }
    
    let strawberry = Fruit()
    let banana = Fruit()
    let kiwi = Fruit()
    let pineapple = Fruit()
    let mango = Fruit()
    
    func changeInventory(fruit: Fruit, number: Int) {
        fruit.stock -= number
    }
}
