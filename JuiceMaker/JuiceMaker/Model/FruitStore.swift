//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    var strawberries = Fruit(name: "딸기", count: 10)
    var bananas = Fruit(name: "바나나", count: 10)
    var pineapples = Fruit(name: "파인애플", count: 10)
    var kiwis = Fruit(name: "키위", count: 10)
    var mangos = Fruit(name: "망고", count: 10)
    
    func manageFruit(fruit: FruitType, usedCount: Int) {
        let fruitName = fruit.rawValue
        
        switch fruit {
        case .strawberry:
            changeCount(fruit: &self.strawberries, usedCount: usedCount)
        case .banana:
            changeCount(fruit: &self.bananas, usedCount: usedCount)
        case .pineapple:
            changeCount(fruit: &self.pineapples, usedCount: usedCount)
        case .kiwi:
            changeCount(fruit: &self.kiwis, usedCount: usedCount)
        case .mango:
            changeCount(fruit: &self.mangos, usedCount: usedCount)
        }
    }
    
    func changeCount(fruit: inout Fruit, usedCount: Int) {
        let afterCount = fruit.count - usedCount
        if checkCount(afterCount: afterCount) {
            fruit.count = afterCount
            print(fruit.count)
        }
    }
    
    func checkCount(afterCount: Int) -> Bool {
        if afterCount >= 0 {
            return true
        } else {
            print("재고가 부족합니다.")
            return false
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
