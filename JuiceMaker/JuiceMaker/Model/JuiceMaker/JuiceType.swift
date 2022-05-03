//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by Derrick kim on 2022/04/28.
//

import Foundation

enum JuiceType: Int {
    case strawberryJuice = 1
    case bananaJuice = 2
    case kiwiJuice = 3
    case mangoJuice = 4
    case pineappleJuice = 5
    case strawberryBananaJuice = 6
    case mangoKiwiJuice = 7
}

extension JuiceType {
    
    func requireIngredients() -> [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry : 16]
        case .bananaJuice:
            return [.banana : 2]
        case .kiwiJuice:
            return [.kiwi : 3]
        case .mangoJuice:
            return [.mango : 3]
        case .pineappleJuice:
            return [.pineapple : 2]
        case .strawberryBananaJuice:
            return [.strawberry : 10, .banana : 1]
        case .mangoKiwiJuice:
            return [.mango : 2, .kiwi : 1]
        }
    }
}
