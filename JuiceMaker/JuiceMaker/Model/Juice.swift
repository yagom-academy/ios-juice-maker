//
//  Juice.swift
//  JuiceMaker
//
//  Created by temp2 on 2022/02/15.
//

import Foundation

/// 쥬스 종류
enum Juice: CaseIterable {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    /// 쥬스의 레시피
    var recipe: Recipe {
        switch self {
        case .strawberryJuice:
            return Recipe(fruitList: [(.strawberry, 16)])
        case .bananaJuice:
            return Recipe(fruitList: [(.banana, 2)])
        case .pineappleJuice:
            return Recipe(fruitList: [(.pineapple, 2)])
        case .kiwiJuice:
            return Recipe(fruitList: [(.kiwi, 3)])
        case .mangoJuice:
            return Recipe(fruitList: [(.mango, 3)])
        case .strawberryBananaJuice:
            return Recipe(fruitList: [(.strawberry, 10), (.banana, 1)])
        case .mangoKiwiJuice:
            return Recipe(fruitList: [(.mango, 2), (.kiwi, 1)])
        }
    }
    
    var order: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스 주문"
        case .bananaJuice:
            return "바나나쥬스 주문"
        case .pineappleJuice:
            return "파인애플 쥬스 주문"
        case .kiwiJuice:
            return "키위쥬스 주문"
        case .mangoJuice:
            return "망고쥬스 주문"
        case .strawberryBananaJuice:
            return "딸바쥬스 주문"
        case .mangoKiwiJuice:
            return "망키쥬스 주문"
        }
    }
}
