//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private(set) var strawberry: Fruit = Fruit(name: "딸기", quantity: 10)
    private(set) var banana: Fruit = Fruit(name: "바나나", quantity: 10)
    private(set) var pineapple: Fruit = Fruit(name: "파인애플", quantity: 10)
    private(set) var kiwi: Fruit = Fruit(name: "키위", quantity: 10)
    private(set) var mango: Fruit = Fruit(name: "망고", quantity: 10)
    
    func changeStock(of fruits: Fruit..., by quantity: Int...) {
        for index in fruits.indices {
            fruits[index].quantity -= quantity[index]
        }
    }
}
