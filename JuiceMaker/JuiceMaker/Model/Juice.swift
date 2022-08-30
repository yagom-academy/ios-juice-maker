//
//  Juice.swift
//  JuiceMaker
//
//  Created by Mene, Dragon on 2022/08/30.
//

enum Juice {
    case strawBerry
    case banana
    case pineApple
    case kiwi
    case mango
    case strawBerryBanana
    case mangoKiwi
    
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
            return [.strawBerry:10, .banana: 1]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
