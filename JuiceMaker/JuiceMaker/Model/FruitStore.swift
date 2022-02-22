//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    struct Fruit {
        var name: String
        var count: Int
    }
    
    var strawberry = Fruit(name: "strawberry", count: 10)
    var banana = Fruit(name: "banana", count: 10)
    var pineapple = Fruit(name: "pineapple", count: 10)
    var kiwi = Fruit(name: "kiwi", count: 10)
    var mango = Fruit(name: "mango", count: 10)
    var fruitLists = [
        Fruit(name: "strawberry", count: 10),
        Fruit(name: "banana", count: 10),
        Fruit(name: "pineapple", count: 10),
        Fruit(name: "kiwi", count: 10),
        Fruit(name: "mango", count: 10)
    ]
}
