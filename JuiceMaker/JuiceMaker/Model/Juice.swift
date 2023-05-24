//
//  Juice.swift
//  JuiceMaker
//
//  Created by JSB, Hemg on 2023/05/09.
//

enum Juice: String {
    case strawberryJuice = "딸기"
    case bananaJuice = "바나나"
    case pineappleJuice = "파인애플"
    case kiwiJuice = "키위"
    case mangoJuice = "망고"
    case strawberryBananaJuice = "딸바"
    case mangoKiwiJuice = "망키"
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoJuice:
            return [.mango: 3]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}


