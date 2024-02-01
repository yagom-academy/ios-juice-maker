//
//  Juice.swift
//  JuiceMaker
//
//  Created by prism, gray on 1/17/24.
//

enum Juice {
    case strawberryBanana
    case mangoKiwi
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .pineapple:
            return [.pineapple: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .mango:
            return [.mango: 3]
        }
    }
    
    var name: String {
        switch self {
        case .strawberryBanana:
            return "딸바"
        case .mangoKiwi:
            return "망키"
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .pineapple:
            return "파인애플"
        case .kiwi:
            return "키위"
        case .mango:
            return "망고"
        }
    }
}
