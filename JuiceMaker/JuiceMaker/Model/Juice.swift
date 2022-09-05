//
//  Juice.swift
//  JuiceMaker
//
//  Created by Gundy, 준호
//

enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaMixJuice
    case mangoJuice
    case mangoKiwiMixJuice
    
    struct Ingredient {
        let fruit: Fruit
        let amount: Int
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
        case .strawberryBananaMixJuice:
            return "딸바쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .mangoKiwiMixJuice:
            return "망키쥬스"
        }
    }
    
    var recipe: [Ingredient] {
        switch self {
        case .strawberryJuice:
            return [Ingredient(fruit: .strawberry, amount: 16)]
        case .bananaJuice:
            return [Ingredient(fruit: .banana, amount: 2)]
        case .kiwiJuice:
            return [Ingredient(fruit: .kiwi, amount: 3)]
        case .pineappleJuice:
            return [Ingredient(fruit: .pineapple, amount: 2)]
        case .strawberryBananaMixJuice:
            return [Ingredient(fruit: .strawberry, amount: 10), Ingredient(fruit: .banana, amount: 1)]
        case .mangoJuice:
            return [Ingredient(fruit: .mango, amount: 3)]
        case .mangoKiwiMixJuice:
            return [Ingredient(fruit: .mango, amount: 2), Ingredient(fruit: .kiwi, amount: 1)]
        }
    }
}
