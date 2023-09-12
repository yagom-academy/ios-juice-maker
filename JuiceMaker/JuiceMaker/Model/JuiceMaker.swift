//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore(fruitStock: [.strawbery: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10])
    
    func subtractFruitStock(juice: Juice) {
        for (name, count) in fruitStore.fruitStock {
            fruitStore.subtractFruitStock(fruitName: name, count: count)
        }
    }
}
