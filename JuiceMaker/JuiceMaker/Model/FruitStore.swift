//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Inventory {
    static let strawberryCount = 10
    static let bananaCount = 10
    static let pineappleCount = 10
    static let kiwiCount = 10
    static let mangoCount = 10
}

enum FruitCategory: Int {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case mango 
    
    var koreanName: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .pineapple:
            return "파인애플"
        case .mango:
            return "망고"
        }
    }
}

struct FruitStore {
    var bucket = [
        Fruit(name: .strawberry, count: Inventory.strawberryCount),
        Fruit(name: .banana, count: Inventory.bananaCount),
        Fruit(name: .pineapple, count: Inventory.pineappleCount),
        Fruit(name: .kiwi, count: Inventory.kiwiCount),
        Fruit(name: .mango, count: Inventory.mangoCount)
    ]
    
    func manageFruit(fruit: FruitCategory, usedCount: Int) {
//        switch fruit {
//        case .strawberry:
//            changeCount(fruit: self.strawberries, usedCount: usedCount)
//        case .banana:
//            changeCount(fruit: self.bananas, usedCount: usedCount)
//        case .pineapple:
//            changeCount(fruit: self.pineapples, usedCount: usedCount)
//        case .kiwi:
//            changeCount(fruit: self.kiwis, usedCount: usedCount)
//        case .mango:
//            changeCount(fruit: self.mangos, usedCount: usedCount)
//        }
    }
    
    func changeCount(fruit: Fruit, usedCount: Int) {
        let afterCount = fruit.count - usedCount
        if isAvailable(afterCount: afterCount) {
            fruit.count = afterCount
            print(fruit.count)
        }
    }
    
    func isAvailable(afterCount: Int) -> Bool {
        if afterCount >= 0 {
            return true
        } else {
            print("재고가 부족합니다.")
            return false
        }
    }
}

class Fruit {
    let name: FruitCategory
    var count: Int
    
    init(name: FruitCategory, count: Int) {
        self.name = name
        self.count = count
    }
}
