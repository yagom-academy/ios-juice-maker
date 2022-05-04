//
//  Juice.swift
//  JuiceMaker
//
//  Created by bradheo65, bonf, ZZBAE on 2022/04/26.
//

enum Juice: Int, CaseIterable {
    case strawberry 
    case banana
    case kiwi
    case mango
    case pineapple
    case strawberryBanana
    case mangoKiwi

    var name: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .mango:
            return "망고"
        case .pineapple:
            return "파인애플"
        case .strawberryBanana:
            return "딸바"
        case .mangoKiwi:
            return "망키"
        }
    }
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .mango:
            return [.mango: 3]
        case .pineapple:
            return [.pineapple: 2]
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
