//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitInventory: [Fruit:Int] = [:]
    
    init() {
        let initialAmount: Int = 10
        fruitInventory = [
            .strawberry: initialAmount,
            .banana: initialAmount,
            .kiwi: initialAmount,
            .pineapple: initialAmount,
            .mango: initialAmount
        ]
    }
    
    func usedLeftover(_ fruit: Fruit, by amount :Int) {
        guard (fruitInventory[fruit]? -= amount) != nil else {
            return
        }
        print("남은 \(fruit)의 수: \(fruitInventory[fruit] ?? 0)")
    }
    
    func checkInventory(about fruit: Fruit, by amount :Int) throws {
        guard let stock = fruitInventory[fruit],
              stock >= amount else {
            throw JuiceMakerError.outOfStock
        }
    }
}
