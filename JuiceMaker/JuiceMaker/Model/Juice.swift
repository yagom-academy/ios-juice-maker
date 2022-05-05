//
//  Juice.swift
//  JuiceMaker
//
//  Created by 수꿍, 바드 on 2022/04/26.
//

enum Juice {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case strawberryBanana
    case mango
    case mangoKiwi
    case unknownFruit
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
        case .unknownFruit:
            return ""
        }
    }
}
