//
//  JuiceRecipe.swift
//  JuiceMaker
//
//  Created by LeeChiheon on 2022/04/25.
//

import Foundation

enum JuiceRecipe {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    func returnCount() -> Int {
        switch self {
        case .strawberryJuice:
            return 16
        case .bananaJuice, .pineappleJuice:
            return 2
        case .kiwiJuice, .mangoJuice:
            return 3
        case .strawberryBananaJuice, .mangoKiwiJuice:
            return 0
        }
    }
}
