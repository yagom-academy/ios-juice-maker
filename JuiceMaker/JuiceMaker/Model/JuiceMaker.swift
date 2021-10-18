//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    case strawberryBanana
    case mangoKiwi
    
    var recipe: [(Fruit, Int)] {
        switch self {
        case .strawberry:
            return [(.strawberry, 16)]
        case .banana:
            return [(.banana, 2)]
        case .pineapple:
            return [(.pineapple, 2)]
        case .kiwi:
            return [(.kiwi, 3)]
        case .mango:
            return [(.mango, 3)]
        case .strawberryBanana:
            return [(.strawberry, 10), (.banana, 1)]
        case .mangoKiwi:
            return [(.mango, 2), (.kiwi, 1)]
        }
    }
}

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func hasIngredients(`for` juice: Juice) -> Bool {
        let recipe = juice.recipe
        
        for (fruit, demandingAmount) in recipe {
            guard let leftAmount = fruitStore.inventory[fruit] else {
                return false // TODO: 오류처리 예정
            }
            
            guard leftAmount >= demandingAmount else {
                return false
            }
        }
        
        return true
    }
}

