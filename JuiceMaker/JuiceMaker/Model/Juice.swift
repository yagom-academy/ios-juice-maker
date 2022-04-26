//
//  Juice.swift
//  JuiceMaker
//
//  Created by kiwi, unchain123 on 2022/04/26.
//

import Foundation

enum Juice {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice



var recipe: [Fruits : Int] {
    switch self {
    case .strawberryJuice:
        return [.strawberry: 16]
    case .bananaJuice:
        return [.banana: 2]
    case .kiwiJuice:
        return [.kiwi: 3]
    case .pineappleJuice:
        return [.pineapple: 2]
    case .mangoJuice:
        return [.mango: 3]
    case .strawberryBananaJuice:
        return [.strawberry: 10, .banana: 1]
    case .mangoKiwiJuice:
        return [.mango: 2, .kiwi: 1]
    }
    
}
}
