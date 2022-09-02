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
