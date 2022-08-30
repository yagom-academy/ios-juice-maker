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
        let fruit: Fruit
        let amount: Int
    }
    
    var recipe: [Material] {
        switch self {
        case .strawberry:
            return [Material(fruit: .strawberry, amount: 16)]
        case .banana:
            return [Material(fruit: .banana, amount: 2)]
        case .kiwi:
            return [Material(fruit: .kiwi, amount: 3)]
        case .pineapple:
            return [Material(fruit: .pineapple, amount: 2)]
        case .strawberryBananaMix:
            return [Material(fruit: .strawberry, amount: 10), Material(fruit: .banana, amount: 1)]
        case .mango:
            return [Material(fruit: .mango, amount: 3)]
        case .mangoKiwiMix:
            return [Material(fruit: .mango, amount: 2), Material(fruit: .kiwi, amount: 1)]
        }
    }
}
