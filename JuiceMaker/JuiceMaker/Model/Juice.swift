//
//  Juice.swift
//  JuiceMaker
//
//  Created by 이지원 on 2022/02/15.
//

import Foundation

enum Juice: Int {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    var recipe: [Material] {
        switch self {
        case .strawberryJuice:
            return [Material(fruit: .strawberry, count: 16)]
        case .bananaJuice:
            return [Material(fruit: .banana, count: 2)]
        case .kiwiJuice:
            return [Material(fruit: .kiwi, count: 3)]
        case .pineappleJuice:
            return [Material(fruit: .pineapple, count: 2)]
        case .mangoJuice:
            return [Material(fruit: .mango, count: 3)]
        case .strawberryBananaJuice:
            return [
                Material(fruit: .strawberry, count: 10),
                Material(fruit: .banana, count: 1)
            ]
        case .mangoKiwiJuice:
            return [
                Material(fruit: .mango, count: 2),
                Material(fruit: .kiwi, count: 1)
            ]
        }
    }
}
