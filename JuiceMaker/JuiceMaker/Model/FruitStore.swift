//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입
class Fruit {
    var stock = 10
    
    func increaseStock() {
        stock += 1
    }
    func decreaseStock() {
        stock -= 1
    }
    func decreaseStock(number: Int) {
        stock -= number
    }
}

class FruitStore {
    let strawberry = Fruit()
    let banana = Fruit()
    let kiwi = Fruit()
    let pineapple = Fruit()
    let mango = Fruit()
}
