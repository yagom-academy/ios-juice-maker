//
//  Recipe.swift
//  JuiceMaker
//
//  Created by 훈맹구 on 2023/05/08.
//

enum Juice: Int {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    struct Ingredient {
        let name: Fruit
        let quantity: Int
    }
    
    var recipe: [Ingredient] {
        switch self {
        case .strawberryJuice:
            return [Ingredient(name: .strawberry, quantity: 16)]
        case .bananaJuice:
            return [Ingredient(name: .banana, quantity: 2)]
        case .kiwiJuice:
            return [Ingredient(name: .kiwi, quantity: 3)]
        case .pineappleJuice:
            return [Ingredient(name: .pineapple, quantity: 2)]
        case .strawberryBananaJuice:
            return [Ingredient(name: .strawberry, quantity: 10),
                    Ingredient(name: .banana, quantity: 1)]
        case .mangoJuice:
            return [Ingredient(name: .mango, quantity: 3)]
        case .mangoKiwiJuice:
            return [Ingredient(name: .mango, quantity: 2),
                    Ingredient(name: .kiwi, quantity: 1)]
        }
    }
}
