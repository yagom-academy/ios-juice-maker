//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by Yena on 2023/05/09.
//

import Foundation

enum JuiceType {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    struct Recipe {
        let first: (FruitType, Int), second: (FruitType, Int)?
    }
    
    var recipe: Recipe {
        switch self {
        case .strawberryJuice:
            return Recipe(first: (.strawberry, 16), second: nil)
        case .bananaJuice:
            return Recipe(first: (.banana, 2), second: nil)
        case .kiwiJuice:
            return Recipe(first: (.kiwi, 3), second: nil)
        case .pineappleJuice:
            return Recipe(first: (.pineapple, 2), second: nil)
        case .strawberryBananaJuice:
            return Recipe(first: (.strawberry, 10), second: (.banana, 1))
        case .mangoJuice:
            return Recipe(first: (.mango, 3), second: nil)
        case .mangoKiwiJuice:
            return Recipe(first: (.mango, 2), second: (.kiwi, 1))
        }
    }
}
