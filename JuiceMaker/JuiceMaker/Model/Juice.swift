//
//  Fruit.swift
//  JuiceMaker
//
//  Created by Kyo, TaeLee on 2022/08/29.
//

enum Juice {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
        
    var recipe: [(name: Fruit, count: Int)] {
        switch self {
        case .strawberryJuice:
            return [(name: .strawberry, count: 16)]
        case .bananaJuice:
            return [(name: .banana, count: 2)]
        case .pineappleJuice:
            return [(name: .pineapple, count: 2)]
        case .kiwiJuice:
            return [(name: .kiwi, count: 3)]
        case .mangoJuice:
            return [(name: .mango, count: 3)]
        case .strawberryBananaJuice:
            return [(name: .strawberry, count: 10), (name: .banana, count: 1)]
        case .mangoKiwiJuice:
            return [(name: .mango, count: 2), (name: .kiwi, count: 2)]
        }
    }
}
