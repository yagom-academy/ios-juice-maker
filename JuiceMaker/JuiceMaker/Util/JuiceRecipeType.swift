//
//  JuiceRecipeType.swift
//  JuiceMaker
//
//  Created by 강경 on 2022/02/16.
//

import Foundation

enum JuiceRecipeType: Hashable, CaseIterable {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBanananJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var recipe: JuiceRecipe {
        switch self {
        case .strawberryJuice:
            return JuiceRecipe(ingredients: [.init(fruit: .strawberry, number: 16)])
        case .bananaJuice:
            return JuiceRecipe(ingredients: [.init(fruit: .banana, number: 2)])
        case .kiwiJuice:
            return JuiceRecipe(ingredients: [.init(fruit: .kiwi, number: 3)])
        case .pineappleJuice:
            return JuiceRecipe(ingredients: [.init(fruit: .pineapple, number: 2)])
        case .strawberryBanananJuice:
            return JuiceRecipe(ingredients: [.init(fruit: .strawberry, number: 10),
                                             .init(fruit: .banana, number: 1)])
        case .mangoJuice:
            return JuiceRecipe(ingredients: [.init(fruit: .mango, number: 3)])
        case .mangoKiwiJuice:
            return JuiceRecipe(ingredients: [.init(fruit: .mango, number: 2),
                                             .init(fruit: .kiwi, number: 1)])
        }
    }
    
    var name: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .strawberryBanananJuice:
            return "딸바쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .mangoKiwiJuice:
            return "망고키위쥬스"
        }
    }
}
