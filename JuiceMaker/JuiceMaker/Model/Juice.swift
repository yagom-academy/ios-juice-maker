//
//  Juice.swift
//  JuiceMaker
//
//  Created by mireu,charles on 2023/09/12.
//

enum Juice {
    case strawberyJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberyBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberyJuice:
            return [.strawbery: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .strawberyBananaJuice:
            return [.strawbery: 10, .banana: 1]
        case .mangoJuice:
            return [.mango: 3]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
