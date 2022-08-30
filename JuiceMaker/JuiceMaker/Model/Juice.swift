//
//  Juice.swift
//  JuiceMaker
//
//  Created by som, LJ on 2022/08/30.
//

import Foundation

enum Juice: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineAppleJuice = "파인애플쥬스"
    case strawberryBananaJuice = "딸바쥬스"
    case mangoJuice = "망고쥬스"
    case mangoKiwiJuice = "망고키위쥬스"
    
    struct Ingredient {
        let first: (Fruit, Int)
        let second: (Fruit, Int)?
    }
    
    var recipeOFJuice: Ingredient {
        switch self {
        case .strawberryJuice:
            return Ingredient(first: (.strawberry, 16), second: nil)
        case .bananaJuice:
            return Ingredient(first: (.banna, 2), second: nil)
        case .kiwiJuice:
            return Ingredient(first: (.kiwi, 3), second: nil)
        case .pineAppleJuice:
            return Ingredient(first: (.pineApple, 2), second: nil)
        case .strawberryBananaJuice:
            return Ingredient(first: (.strawberry, 10), second: nil)
        case .mangoJuice:
            return Ingredient(first: (.mango, 3), second: nil)
        case .mangoKiwiJuice:
            return Ingredient(first: (.mango, 2), second: (.kiwi, 1))
        }
    }
}
