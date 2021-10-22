//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by 박병호 on 2021/10/21.
//
enum JuiceMenu {
    case strawberry, banana, kiwi, pineapple, mango, strawberryBanana, mangoKiwi
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case.kiwi:
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
