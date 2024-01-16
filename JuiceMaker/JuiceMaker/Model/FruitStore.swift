//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var strawberries = Fruit(name: "딸기", count: 10)
    var bananas = Fruit(name: "바나나", count: 10)
    var pineapples = Fruit(name: "파인애플", count: 10)
    var kiwis = Fruit(name: "키위", count: 10)
    var mangos = Fruit(name: "망고", count: 10)
    
    func changeCount(fruit: Fruit, usedCount: Int) -> Int {
        var beforeCount = fruit.count
        var afterCount = beforeCount - usedCount
        
        if afterCount >= 0 {
            return afterCount
        } else {
            return 0
        }
    }
}

class Fruit {
    var name: String
    var count: Int
    
    init(name: String, count: Int) {
        self.name = name
        self.count = count
    }
}
