//
//  Juice.swift
//  JuiceMaker
//
//  Created by Erick, JusBug on 2023/05/11.
//

import Foundation

enum Juice: String {
    case strawberryJuice = "딸기쥬스 주문"
    case bananaJuice = "바나나쥬스 주문"
    case pineappleJuice = "파인애플쥬스 주문"
    case kiwiJuice = "키위쥬스 주문"
    case mangoJuice = "망고쥬스 주문"
    case strawberryBananaJuice = "딸바쥬스 주문"
    case mangoKiwiJuice = "망키쥬스 주문"
    
    var ingredients: [Fruit: Int] {
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
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
    
    var name: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .strawberryBananaJuice:
            return "딸바쥬스"
        case .mangoKiwiJuice:
            return "망키쥬스"
        }
    }
}
