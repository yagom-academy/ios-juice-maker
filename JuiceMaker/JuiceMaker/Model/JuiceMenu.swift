//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by 김민제 on 1/24/24.
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
    
    var ingredients: [String: Int] {
        switch self {
        case .strawberry:
            return ["딸기": 16]
        case .strawberryBanana:
            return ["딸기": 10, "바나나": 1]
        case .banana:
            return ["바나나": 2]
        case .kiwi:
            return ["키위": 3]
        case .pineapple:
            return ["파인애플": 2]
        case .mango:
            return ["망고": 3]
        case .mangokiwi:
            return ["망고": 2, "키위": 1]
        }
    }
}
