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
    
    mutating func manageFruits(recipes: [Combination]) {
            var flag = true
            
            for index in 0..<recipes.count {
                let fruitCategory = recipes[index].fruitName
                let countToUse = recipes[index].count
                
                if !isAvailable(fruitCategory: fruitCategory, countToUse: countToUse) {
                    flag = false
                    print("\(fruitCategory.koreanName)의 재고가 부족합니다!")
                    break
                }
            }
            
            if flag {
                for index in 0..<recipes.count {
                    let fruitCategoryIndex = recipes[index].fruitName.rawValue
                    let countToUse = recipes[index].count
                    
                    self.bucket[fruitCategoryIndex].count -= countToUse
                }
            }
        }
    
    func isAvailable(fruitCategory: FruitCategory, countToUse: Int) -> Bool {
        if self.bucket[fruitCategory.rawValue].count - countToUse >= 0 {
            return true
        } else {
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
