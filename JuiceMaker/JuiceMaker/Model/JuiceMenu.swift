//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by Jun Bang on 2021/10/20.
//

import Foundation

enum JuiceMenu: String {
    case strawberryJuice = "딸기쥬스"
    case banannaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case strawberryBanannaJuice = "딸바쥬스"
    case mangoJuice = "망고쥬스"
    case mangoKiwiJuice = "망고키위쥬스"
    
    var recipe: JuiceRecipe {
        switch self {
        case .strawberryJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .strawberry, amount: 16)])
        case .banannaJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .bananna, amount: 2)])
        case .kiwiJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .kiwi, amount: 3)])
        case .pineappleJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .pineapple, amount: 2)])
        case .strawberryBanannaJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .strawberry, amount: 10), Ingredient(fruit: .bananna, amount: 1)])
        case .mangoJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .mango, amount: 3)])
        case .mangoKiwiJuice:
            return JuiceRecipe(ingredients: [Ingredient(fruit: .mango, amount: 2), Ingredient(fruit: .kiwi, amount: 1)])
        }
    }
}
