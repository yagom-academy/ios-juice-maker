//
//  EnumCollection.swift
//  JuiceMaker
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum initCount {
    case Fruit
    
    var amount: Int {
        switch self {
        case .Fruit:
            return 10
        }
    }
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
