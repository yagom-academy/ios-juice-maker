//
//  Juice.swift
//  JuiceMaker
//
//  Created by hemg on 2023/05/09.
//

enum Juice {
    case strawBerryJuice
    case bananaJuice
    case pineAppleJuice
    case kiwiJuice
    case mangoJuice
    case strawBerryBananaJuice
    case mangoKiwiJuice
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawBerryJuice:
            return [.strawBerry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineAppleJuice:
            return [.pineApple: 2]
        case .strawBerryBananaJuice:
            return [.strawBerry: 10, .banana: 1]
        case .mangoJuice:
            return [.mango: 3]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}


