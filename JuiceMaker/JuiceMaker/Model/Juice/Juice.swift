//
//  Juice.swift
//  JuiceMaker
//
//  Created by bradheo65, bonf, ZZBAE on 2022/04/26.
//

enum Juice: CaseIterable {
    case strawberry
    case banana
    case strawberryBanana
    case mango
    case mangoKiwi
    case kiwi
    case pineapple

    var recipeOfJuice: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mango:
            return [.mango: 3]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        case .kiwi:
            return [.kiwi: 3]
        case .pineapple:
            return [.pineapple: 2]
        }
    }
}
