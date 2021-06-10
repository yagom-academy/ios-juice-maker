//
//  JuiceMaker - JuiceMaker.swift
//  Created by luyan. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    var store: FruitStore = FruitStore()
    
    enum JuiceMenu {
        case strawberry
        case banana
        case kiwi
        case fineapple
        case strawberryBanana
        case mango
        case mangoKiwi
        
        var recipe: [HandlingFruit:Int] {
            switch self {
            case .strawberry:
                return [.strawberry:16]
            case .banana:
                return [.banana:10]
            case .kiwi:
                return [.kiwi:3]
            case .fineapple:
                return [.fineapple:2]
            case .strawberryBanana:
                return [.strawberry:10, .banana:1]
            case .mango:
                return [.mango:3]
            case .mangoKiwi:
                return [.mango:2, .kiwi:1]
            }
        }
    }
}
