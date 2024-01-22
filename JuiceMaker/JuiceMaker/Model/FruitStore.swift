//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct Stock {
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
    var inventory = [
        Fruit(name: .strawberry, count: Stock.strawberryCount),
        Fruit(name: .banana, count: Stock.bananaCount),
        Fruit(name: .pineapple, count: Stock.pineappleCount),
        Fruit(name: .kiwi, count: Stock.kiwiCount),
        Fruit(name: .mango, count: Stock.mangoCount)
    ]
    
    mutating func manageFruits(recipes: [Combination]) -> Bool {
        for index in 0..<recipes.count {
            let fruitCategory = recipes[index].fruitName
            let countToUse = recipes[index].count
            
            if !isAvailable(fruitCategory: fruitCategory, countToUse: countToUse) {
                print("\(fruitCategory.koreanName)의 재고가 부족합니다!")
                return false
            }
        }
        return true
    }
    
    func isAvailable(fruitCategory: FruitCategory, countToUse: Int) -> Bool {
        if self.inventory[fruitCategory.rawValue].count - countToUse >= 0 {
            return true
        } else {
            return false
        }
    }
    
    func consumeStock(recipes: [Combination]){
        for index in 0..<recipes.count {
            let fruitCategoryIndex = recipes[index].fruitName.rawValue
            let countToUse = recipes[index].count
            
            self.inventory[fruitCategoryIndex].count -= countToUse
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
