//
//  Type.swift
//  JuiceMaker
//
//  Created by 송종환 on 2023/01/03.
//

import Foundation

enum Identifier: String {
    case fruitStoreNavigationController = "fruitStoreNavigationController"
}

enum Fruit: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case pineapple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
}

enum FruitJuice: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case pineappleJuice = "파인애플쥬스"
    case kiwiJuice = "키위쥬스"
    case mangoJuice = "망고쥬스"
    case strawberryBananaJuice = "딸바쥬스"
    case mangoKiwiJuice = "망키쥬스"
    
    var ingredient: [Fruit: Int] {
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
}

enum juiceMakeError: Error {
    case outOfStockError
    case unknwonError
}
