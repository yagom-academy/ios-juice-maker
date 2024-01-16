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
    
    func changeCount(fruit: FruitType, usedCount: Int) {
        let fruitName = fruit.rawValue
        
        switch fruit {
        case .strawberry:
            let afterCount = self.strawberries.count - usedCount
            if afterCount >= 0 {
                self.strawberries.count = self.strawberries.count - usedCount
                print(self.strawberries.count)
            } else {
                print("\(fruitName)의 재고가 부족합니다.")
            }
        case .banana:
            let afterCount = self.bananas.count - usedCount
            if afterCount >= 0 {
                self.bananas.count = self.bananas.count - usedCount
                print(self.bananas.count)
            } else {
                print("\(fruitName)의 재고가 부족합니다.")
            }
        case .pineapple:
            let afterCount = self.pineapples.count - usedCount
            if afterCount >= 0 {
                self.pineapples.count = self.pineapples.count - usedCount
                print(self.pineapples.count)
            } else {
                print("\(fruitName)의 재고가 부족합니다.")
            }
        case .kiwi:
            let afterCount = self.kiwis.count - usedCount
            if afterCount >= 0 {
                self.kiwis.count = self.kiwis.count - usedCount
                print(self.kiwis.count)
            } else {
                print("\(fruitName)의 재고가 부족합니다.")
            }
        case .mango:
            let afterCount = self.mangos.count - usedCount
            if afterCount >= 0 {
                self.mangos.count = self.mangos.count - usedCount
                print(self.mangos.count)
            } else {
                print("\(fruitName)의 재고가 부족합니다.")
            }
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
