//
//  Juice.swift
//  JuiceMaker
//
//  Created by Minsup, Serena on 2023/05/09.
//

enum Juice: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case strawberryBananaJuice = "딸바쥬스"
    case mangoJuice = "망고쥬스"
    case mangoKiwiJuice = "망키쥬스"
    case unknown
    
    var name: String {
        self.rawValue
    }
    
    var recipe: Recipe {
        switch self {
        case .strawberryJuice:
            return [(fruit: .strawberry, amount: 16)]
        case .bananaJuice:
            return [(fruit: .banana, amount: 2)]
        case .kiwiJuice:
            return [(fruit: .kiwi, amount: 3)]
        case .pineappleJuice:
            return [(fruit: .pineapple, amount: 2)]
        case .strawberryBananaJuice:
            return  [(fruit: .strawberry, amount: 10), (fruit: .banana, amount: 1)]
        case .mangoJuice:
            return [(fruit: .mango, amount: 3)]
        case .mangoKiwiJuice:
            return [(fruit: .mango, amount: 2), (fruit: .kiwi, amount: 1)]
        case .unknown:
            return []
        }
    }
}
