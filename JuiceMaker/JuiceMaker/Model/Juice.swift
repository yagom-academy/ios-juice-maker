//
//  Juice.swift
//  JuiceMaker
//
//  Created by taehun kim on 2022/02/22.
//

enum Juice {
    case strawberryJuice
    case kiwiJuice
    case bananaJuice
    case pineappleJuice
    case mangoJuice
    case mangoKiwiJuice
    case strawberryBananaJuice
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .bananaJuice:
            return [.banana: 2]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .mangoJuice:
            return [.mango: 3]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        }
    }
}
