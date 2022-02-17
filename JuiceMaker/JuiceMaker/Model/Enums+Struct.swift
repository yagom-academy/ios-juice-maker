//
//  Enums+Struct.swift
//  JuiceMaker
//
//  Created by 추니 & Davy.
//

import Foundation

struct Recipe {
    let fruit: Fruit
    let amount: Int
}

struct JuiceResult {
    let isSuccess: Bool
    let message: String?
}

struct ErrorMessages {
    static let nonExistentFruitMessage = "과일이 존재하지 않습니다."
    static let outOfStockMessage = "재고가 부족합니다."
}

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    static let initialCount = 10
}

enum FruitError: String, Error {
    case outOfStock
    case nonExistentFruit
}

extension FruitError: LocalizedError {
    var description: String {
        switch self {
        case .nonExistentFruit:
            return ErrorMessages.nonExistentFruitMessage
        case .outOfStock:
            return ErrorMessages.outOfStockMessage
        }
    }
}

enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var name: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .strawberryBananaJuice:
            return "딸바쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .mangoKiwiJuice:
            return "망키쥬스"
        }
    }
}
