//
//  Juice.swift
//  JuiceMaker
//
//  Created by Mene, Dragon on 2022/08/30.
//

enum Juice: String {
    case strawBerry = "딸기"
    case banana = "바나나"
    case pineApple = "파인애플"
    case kiwi = "키위"
    case mango = "망고"
    case strawBerryBanana = "딸바"
    case mangoKiwi = "망고키위"
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawBerry:
            return [.strawBerry: 16]
        case .banana:
            return [.banana: 2]
        case .pineApple:
            return [.pineApple: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .mango:
            return [.mango: 3]
        case .strawBerryBanana:
            return [.strawBerry: 10, .banana: 1]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
