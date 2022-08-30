//
//  Juice.swift
//  JuiceMaker
//
//  Created by Gundy, 준호
//

enum Juice {
    case strawberry
    case banana
    case kiwi
    case pineapple
    case strawberryBananaMix
    case mango
    case mangoKiwiMix
    
    struct Material {
        var first: (fruit: Fruit, amount: Int)
        var second: (fruit: Fruit, amount: Int)?
    }
    
    var recipe: Material {
        switch self {
        case .strawberry:
            return Material(first: (fruit: .strawberry, amount: 16), second: nil)
        case .banana:
            return Material(first: (fruit: .banana, amount: 2), second: nil)
        case .kiwi:
            return Material(first: (fruit: .kiwi, amount: 3), second: nil)
        case .pineapple:
            return Material(first: (fruit: .pineapple, amount: 2), second: nil)
        case .strawberryBananaMix:
            return Material(first: (fruit: .strawberry, amount: 10), second: (fruit: .banana, amount: 1))
        case .mango:
            return Material(first: (fruit: .mango, amount: 3), second: nil)
        case .mangoKiwiMix:
            return Material(first: (fruit: .mango, amount: 2), second: (fruit: .kiwi, amount: 1))
        }
    }
}
