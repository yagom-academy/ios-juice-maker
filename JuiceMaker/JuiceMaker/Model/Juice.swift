//
//  Juice.swift
//  JuiceMaker
//
//  Created by kiwi, unchain123 on 2022/04/26.
//

import Foundation

enum Juice {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    case strawberryBanana
    case mangoKiwi

        var recipe: [Fruits : Int] {
            switch self {
            case .strawberry:
                return [.strawberry: 16]
            case .banana:
                return [.banana: 2]
            case .kiwi:
                return [.kiwi: 3]
            case .pineapple:
                return [.pineapple: 2]
            case .mango:
                return [.mango: 3]
            case .strawberryBanana:
                return [.strawberry: 10, .banana: 1]
            case .mangoKiwi:
                return [.mango: 2, .kiwi: 1]
    }
    
}
}
