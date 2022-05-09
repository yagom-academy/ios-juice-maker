//
//  EnumCollection.swift
//  JuiceMaker
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum StockCount {
    case empty
    case initFruit
    case maxFruit
    
    var amountInInteger: Int {
        switch self {
        case .empty:
            return 0
        case .initFruit:
            return 10
        case .maxFruit:
            return 100
        }
    }
    var amountInDecimalPoint: Double {
        switch self {
        case .empty:
            return 0.0
        case .initFruit:
            return 10.0
        case .maxFruit:
            return 100.0
        }
    }
}

enum JuiceInfo {
    case JuiceName
}

enum FruitKind {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

enum JuiceKind {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    case none
    
    var recipe: Dictionary<FruitKind, Int> {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .mangoJuice:
            return [.mango: 3]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        case .none:
            return [:]
        }
    }
    
    var juiceNameInKorean: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .strawberryBananaJuice:
            return "딸바쥬스"
        case .mangoKiwiJuice:
            return "망키쥬스"
        case .none:
            return ""
        }
    }
}

enum ErrorCategory: Error {
    case zeroError
    case cannotError
    
    var message: String {
        switch self {
        case .zeroError:
            return "수량이 부족합니다."
        case .cannotError:
            return "제조할 수 없습니다."
        }
    }
}
