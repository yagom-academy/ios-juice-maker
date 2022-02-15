//
//  Juice.swift
//  JuiceMaker
//
//  Created by temp2 on 2022/02/15.
//

import Foundation

enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var recipe: Recipe {
        switch self {
        case .strawberryJuice:
            return Recipe(fruitList: [(.strawberry, 16)])
        case .bananaJuice:
            return Recipe(fruitList: [(.banana, 2)])
        case .pineappleJuice:
            return Recipe(fruitList: [(.pineapple, 2)])
        case .kiwiJuice:
            return Recipe(fruitList: [(.kiwi, 3)])
        case .mangoJuice:
            return Recipe(fruitList: [(.mango, 3)])
        case .strawberryBananaJuice:
            return Recipe(fruitList: [(.strawberry, 10), (.banana, 1)])
        case .mangoKiwiJuice:
            return Recipe(fruitList: [(.mango, 2), (.kiwi, 1)])
        }
    }
}
