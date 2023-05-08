//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var strawberry: Fruit = Fruit(name: "딸기", quantity: 10)
    private var banana: Fruit = Fruit(name: "바나나", quantity: 10)
    private var pineapple: Fruit = Fruit(name: "파인애플", quantity: 10)
    private var kiwi: Fruit = Fruit(name: "키위", quantity: 10)
    private var mango: Fruit = Fruit(name: "망고", quantity: 10)
    
    func changeStock(of fruit: Fruit, quantity: Int) {
        fruit.quantity -= quantity
    }
}
