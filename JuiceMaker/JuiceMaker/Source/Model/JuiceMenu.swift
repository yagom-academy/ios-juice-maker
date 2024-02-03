//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by HAMZZI, Danny on 1/24/24.
//

import Foundation

enum JuiceMenu: String {
    case strawberryJuice
    case strawberryBananaJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var name: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .strawberryBananaJuice:
            return "딸바쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .mangoKiwiJuice:
            return "망키쥬스"
        }
    }
    
    var ingredients: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .mangoJuice:
            return [.mango: 3]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
