//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit {
    case strawberry, banana, pineapple, kiwi, mango
}

// 과일 저장소 타입
class FruitStore {
    private var inventory: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 10,
        .pineapple: 10,
        .kiwi: 10,
        .mango: 10
    ]
    
    func checkStock(of fruit: Fruit) -> Int? {
        if let stock = inventory[fruit] {
            return stock
        } else {
            return nil
        }
    }
}
