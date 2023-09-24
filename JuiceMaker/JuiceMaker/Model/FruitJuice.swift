//
//  FruitJuice.swift
//  Created by uemu, Toy.
//  Copyright © yagom academy. All rights reserved.
//

enum FruitJuice: String {
    case strawberryJuice = "딸기 쥬스"
    case bananaJuice = "바나나 쥬스"
    case kiwiJuice = "키위 쥬스"
    case pineappleJuice = "파인애플 쥬스"
    case mangoJuice = "망고 쥬스"
    case strawberryBananaJuice = "딸바 쥬스"
    case mangoKiwiJuice = "망키 쥬스"
    
    enum Order: String {
        case strawberryJuiceOrder = "딸기쥬스 주문"
        case bananaJuiceOrder = "바나나쥬스 주문"
        case kiwiJuiceOrder = "키위쥬스 주문"
        case pineappleJuiceOrder = "파인애플쥬스 주문"
        case mangoJuiceOrder = "망고쥬스 주문"
        case strawberryBananaJuiceOrder = "딸바쥬스 주문"
        case mangoKiwiJuiceOrder = "망키쥬스 주문"
        
        var juiceOrder: FruitJuice {
            switch self {
            case .strawberryJuiceOrder:
                return .strawberryJuice
            case .bananaJuiceOrder:
                return .bananaJuice
            case .kiwiJuiceOrder:
                return .kiwiJuice
            case .pineappleJuiceOrder:
                return .pineappleJuice
            case .mangoJuiceOrder:
                return .mangoJuice
            case .strawberryBananaJuiceOrder:
                return .strawberryBananaJuice
            case .mangoKiwiJuiceOrder:
                return .mangoKiwiJuice
            }
        }
    }
    
    var juiceRecipe: [Fruit: Int] {
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

