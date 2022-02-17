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
            return Recipe(fruitList: [FruitInfo(fruit: .strawberry, count: 16)])
        case .bananaJuice:
            return Recipe(fruitList: [FruitInfo(fruit: .banana, count: 2)])
        case .pineappleJuice:
            return Recipe(fruitList: [FruitInfo(fruit: .pineapple, count: 2)])
        case .kiwiJuice:
            return Recipe(fruitList: [FruitInfo(fruit: .kiwi, count: 3)])
        case .mangoJuice:
            return Recipe(fruitList: [FruitInfo(fruit: .mango, count: 3)])
        case .strawberryBananaJuice:
            return Recipe(fruitList: [FruitInfo(fruit: .strawberry, count: 10), FruitInfo(fruit: .banana, count: 1)])
        case .mangoKiwiJuice:
            return Recipe(fruitList: [FruitInfo(fruit: .mango, count: 2), FruitInfo(fruit: .kiwi, count: 1)])
        }
    }
}
