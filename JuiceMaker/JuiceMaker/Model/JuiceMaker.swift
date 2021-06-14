//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


enum JuiceRecipe: String {
    case strawberry = "딸기쥬스"
    case banana = "바나나쥬스"
    case kiwi = "키위쥬스"
    case pineapple = "파인애플쥬스"
    case ddalba = "딸바쥬스"
    case mango = "망고쥬스"
    case mangoKiwi = "망키쥬스"
    
    var requiredIngredients: [Fruit: UInt] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
            
        case .banana:
            return [.banana: 2]
            
        case .kiwi:
            return [.kiwi: 3]
            
        case .pineapple:
            return [.pineapple: 2]
            
        case .ddalba:
            return [.strawberry: 10, .banana: 1]
            
        case .mango:
            return [.mango: 3]
            
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
    
    var juiceButtonName: String {
        return "\(self.rawValue) 주문"
    }
}

struct JuiceMaker {
    
    func canMakeJuice(recipe: JuiceRecipe) -> Bool {
        for (fruit, amount) in recipe.requiredIngredients {
            guard FruitStore.shared.hasEnoughFruitsStock(fruit: fruit, number: amount) else {
                return false
            }
        }
        return true
    }
    
    func makeJuice(recipe: JuiceRecipe) {
        for (fruit, amount) in recipe.requiredIngredients {
            FruitStore.shared.consume(fruit: fruit, number: amount)
        }
    }
}




