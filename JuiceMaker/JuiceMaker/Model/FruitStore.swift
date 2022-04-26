//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var stock: [Fruits: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    private let orderQuantity: [Fruits: Int] = [.strawberry: 80, .banana: 10, .pineapple: 10, .kiwi: 15, .mango: 15]
    
    func decreaseStock(menu: Menu, numberOfOrder: Int) {
        for (fruit, need) in menu.recipe {
            stock[fruit]! -= need * numberOfOrder
        }
    }
    
    func fillStock(fruits: [Fruits]) {
        for fruit in fruits {
            stock[fruit] = orderQuantity[fruit]
        }
    }
}
