//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

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

class FruitStore {
    var fruit: [FruitCategory: Int]
    
    init(fruit: [FruitCategory : Int]) {
        self.fruit = fruit
    }
    
    func checkSufficientStock(recipe: [JuiceMenu]) -> Bool {
        for fruitForRecipe in recipe {
            switch fruitForRecipe {
            case .recipe(let fruitName, let number):
                if fruit[fruitName] ?? 0 < number {
                    return false
                }
            }
        }
        return true
    }
    
}
