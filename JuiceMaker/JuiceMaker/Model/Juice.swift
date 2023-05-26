//
//  Juice.swift
//  JuiceMaker
//
//  Created by Karen, myungsun on 2023/05/09.
//

enum Juice: Int, CustomStringConvertible {
    case strawberryBanana
    case mangoKiwi
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango

    var recipe: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
    
    var description: String {
        switch self {
        case .strawberry:
            return "딸기 쥬스"
        case .banana:
            return "바나나 쥬스"
        case .kiwi:
            return "키위 쥬스"
        case .pineapple:
            return "파인애플 쥬스"
        case .strawberryBanana:
            return "딸바 쥬스"
        case .mango:
            return "망고 쥬스"
        case .mangoKiwi:
            return "망고키위 쥬스"
        }
    }
}
