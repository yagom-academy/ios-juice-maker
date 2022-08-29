//
//  Juice.swift
//  JuiceMaker
//
//  Created by Jeremy, Baem.
//

import Foundation

enum Juice {
    case strawBerry
    case banana
    case kiwi
    case pineApple
    case strawBerryBanana
    case mango
    case mangoKiwi
    
    var name: [Fruit: Int] {
        switch self {
        case .strawBerry:
            return [.strawBerry: -16]
        case .banana:
            return [.banana: -2]
        case .kiwi:
            return [.kiwi: -3]
        case .pineApple:
            return [.pineApple: -2]
        case .strawBerryBanana:
            return [.strawBerry: -10, .banana: -1]
        case .mango:
            return [.mango: -3]
        case .mangoKiwi:
            return [.mango: -2, .kiwi: -1]
        }
    }
}


