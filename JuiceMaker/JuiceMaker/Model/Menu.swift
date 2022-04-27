//
//  Menu.swift
//  JuiceMaker
//
//  Created by 이예은 on 2022/04/27.
//

import Foundation

enum Menu: CaseIterable {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryAndBananaJuice
    case mangoAndKiwiJuice
    
    var recipe: [Fruits: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .mangoJuice:
            return [.mango: 3]
        case .strawberryAndBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoAndKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
