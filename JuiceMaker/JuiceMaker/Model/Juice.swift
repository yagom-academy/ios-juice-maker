//
//  Recipe.swift
//  JuiceMaker
//
//  Created by SeoDongyeon on 2022/02/23.
//

enum Juice: CaseIterable {
    typealias Fruit = FruitStore.Fruit
    
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    case strawberryBanana
    case mangoKiwi
    
    var recipe: [Fruit: Int] {
        switch self {
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
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
