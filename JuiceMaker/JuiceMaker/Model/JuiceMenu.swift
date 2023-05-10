//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by EtialMoon, 비모 on 2023/05/10.
//

enum JuiceMenu {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var recipe: [Ingredient] {
        switch self {
        case .strawberryJuice:
            return [
                Ingredient(fruit: .strawberry, amount: 16)
            ]
        case .bananaJuice:
            return [
                Ingredient(fruit: .banana, amount: 2)
            ]
        case .kiwiJuice:
            return [
                Ingredient(fruit: .kiwi, amount: 3)
            ]
        case .pineappleJuice:
            return [
                Ingredient(fruit: .pineapple, amount: 2)
            ]
        case .strawberryBananaJuice:
            return [
                Ingredient(fruit: .strawberry, amount: 10),
                Ingredient(fruit: .banana, amount: 1)
            ]
        case .mangoJuice:
            return [
                Ingredient(fruit: .mango, amount: 3)
            ]
        case .mangoKiwiJuice:
            return [
                Ingredient(fruit: .mango, amount: 2),
                Ingredient(fruit: .kiwi, amount: 1),
            ]
        }
    }
}
