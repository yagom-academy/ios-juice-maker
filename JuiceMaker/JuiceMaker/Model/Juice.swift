//
//  Juice.swift
//  JuiceMaker
//
//  Created by Oh Donggeon on 2022/02/15.
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
    
    var ingredients: [Ingredient<Fruit>] {
        var ingredients: [Ingredient<Fruit>] = []
        switch self {
        case .strawberryJuice:
            ingredients.append(Ingredient(name: .strawberry, count: 16))
        case .bananaJuice:
            ingredients.append(Ingredient(name: .banana, count: 2))
        case .kiwiJuice:
            ingredients.append(Ingredient(name: .kiwi, count: 3))
        case .pineappleJuice:
            ingredients.append(Ingredient(name: .pineapple, count: 2))
        case .strawberryBananaJuice:
            ingredients.append(Ingredient(name: .strawberry, count: 10))
            ingredients.append(Ingredient(name: .banana, count: 1))
        case .mangoJuice:
            ingredients.append(Ingredient(name: .mango, count: 3))
        case .mangoKiwiJuice:
            ingredients.append(Ingredient(name: .mango, count: 2))
            ingredients.append(Ingredient(name: .kiwi, count: 1))
        }
        return ingredients
    }
    
    var name: String {
        switch self {
        case .strawberryJuice:
            return "딸기"
        case .bananaJuice:
            return "바나나"
        case .kiwiJuice:
            return "키위"
        case .pineappleJuice:
            return "파인애플"
        case .strawberryBananaJuice:
            return "딸기 바나나"
        case .mangoJuice:
            return "망고"
        case .mangoKiwiJuice:
            return "망고 키위"
        }
    }
}
