//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by HAMZZI, Danny on 1/24/24.
//

import Foundation

enum JuiceMenu: String {
    case strawberry = "딸기쥬스"
    case strawberryBanana = "딸바쥬스"
    case banana = "바나나쥬스"
    case kiwi = "키위쥬스"
    case pineapple = "파인애플쥬스"
    case mango = "망고쥬스"
    case mangokiwi = "망키쥬스"
    
    var ingredients: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .mango:
            return [.mango: 3]
        case .mangokiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
