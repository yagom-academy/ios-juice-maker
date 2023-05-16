//
//  Juice.swift
//  JuiceMaker
//
//  Created by Whales on 2023/05/16.
//

enum Juice {
    case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, mangoJuice
    case strawberryBananaJuice, mangoKiwiJuice
    
    var name: String {
        switch self {
        case .strawberryJuice:
            return "딸기 쥬스"
        case .bananaJuice:
            return "바나나 쥬스"
        case .kiwiJuice:
            return "키위 쥬스"
        case .pineappleJuice:
            return "파인애플 쥬스"
        case .mangoJuice:
            return "망고 쥬스"
        case .strawberryBananaJuice:
            return "딸바 쥬스"
        case .mangoKiwiJuice:
            return "망키 쥬스"
        }
    }
    
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
        case .mangoJuice:
            return [.mango: 3]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}
