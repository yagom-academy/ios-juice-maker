//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by Derrick kim on 2022/04/28.
//

import Foundation

enum JuiceType: String {
    case strawberryJuice = "딸기"
    case bananaJuice = "바나나"
    case kiwiJuice = "키위"
    case mangoJuice = "망고"
    case pineappleJuice = "파인애플"
    case strawberryBananaJuice = "딸바"
    case mangoKiwiJuice = "망키"
}

extension JuiceType {
//    var localeKorean: String {
//        switch self {
//        case .strawberryJuice:
//            return "딸기"
//        case .bananaJuice:
//            return "바나나"
//        case .kiwiJuice:
//            return "키위"
//        case .mangoJuice:
//            return "망고"
//        case .pineappleJuice:
//            return "파인애플"
//        case .strawberryBananaJuice:
//            return "딸바"
//        case .mangoKiwiJuice:
//            return "망키"
//        }
//    }
    
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
