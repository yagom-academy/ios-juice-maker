//
//  Juice.swift
//  JuiceMaker
//
//  Created by 수꿍, 바드 on 2022/04/26.
//

enum Juice: String {
    case strawberry = "딸기쥬스 주문"
    case banana = "바나나쥬스 주문"
    case pineapple = "파인애플쥬스 주문"
    case kiwi = "키위쥬스 주문"
    case strawberryBanana = "딸바쥬스 주문"
    case mango = "망고쥬스 주문"
    case mangoKiwi = "망키쥬스 주문"
}

extension Juice {
    var name: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .pineapple:
            return "파인애플"
        case .kiwi:
            return "키위"
        case .strawberryBanana:
            return "딸바"
        case .mango:
            return "망고"
        case .mangoKiwi:
            return "망키"
        }
    }
}
