//
//  Juice.swift
//  JuiceMaker
//
//  Created by Eunsoo KIM on 2021/10/19.
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
    
    var recipe: [Fruit] {
        switch self {
        case .strawberryJuice:
            return [Fruit(fruitName: .strawberry, count: 16)]
        case .bananaJuice:
            return [Fruit(fruitName: .banana, count: 2)]
        case .kiwiJuice:
            return [Fruit(fruitName: .kiwi, count: 3)]
        case .pineappleJuice:
            return [Fruit(fruitName: .pineapple, count: 2)]
        case .strawberryBananaJuice:
            return [Fruit(fruitName: .strawberry, count: 10), Fruit(fruitName: .banana, count: 1)]
        case .mangoJuice:
            return [Fruit(fruitName: .mango, count: 3)]
        case .mangoKiwiJuice:
            return [Fruit(fruitName: .mango, count: 2), Fruit(fruitName: .kiwi, count: 1)]
        }
    }
}
