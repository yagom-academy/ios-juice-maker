//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by 박병호 on 2021/10/21.
//
enum JuiceMenu: String {
    case strawberry = "딸기",
         banana = "바나나",
         kiwi = "키위",
         pineapple = "파인애플",
         mango = "망고",
         strawberryBanana = "딸바",
         mangoKiwi = "망키"
    
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
