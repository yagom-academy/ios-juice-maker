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
            return JuiceRecipe(ingredients: [.init(fruit: .strawberry, number: 16)], name: .strawberryJuice)
        case .bananaJuice:
            return JuiceRecipe(ingredients: [.init(fruit: .banana, number: 2)], name: .bananaJuice)
        case .kiwiJuice:
            return JuiceRecipe(ingredients: [.init(fruit: .kiwi, number: 3)], name: .kiwiJuice)
        case .pineappleJuice:
            return JuiceRecipe(ingredients: [.init(fruit: .pineapple, number: 2)], name: .pineappleJuice)
        case .strawberryBanananJuice:
            return JuiceRecipe(ingredients: [.init(fruit: .strawberry, number: 10),
                                      .init(fruit: .banana, number: 1)], name: .strawberryBanananJuice)
        case .mangoJuice:
            return JuiceRecipe(ingredients: [.init(fruit: .mango, number: 3)], name: .mangoJuice)
        case .mangoKiwiJuice:
            return JuiceRecipe(ingredients: [.init(fruit: .mango, number: 2),
                                      .init(fruit: .kiwi, number: 1)], name: .mangoKiwiJuice)
        }
    }
}
