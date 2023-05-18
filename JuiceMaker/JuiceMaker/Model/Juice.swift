//
//  Juice.swift
//  JuiceMaker
//
//  Created by JSB, Hemg on 2023/05/09.
//

enum Juice: String {
    case strawBerryJuice = "딸기 쥬스"
    case bananaJuice = "바나나 쥬스"
    case pineAppleJuice = "파인애플 쥬스"
    case kiwiJuice = "키위 쥬스"
    case mangoJuice = "망고 쥬스"
    case strawBerryBananaJuice = "딸바 쥬스"
    case mangoKiwiJuice = "망키 쥬스"
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawBerryJuice:
            return [.strawBerry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineAppleJuice:
            return [.pineApple: 2]
        case .strawBerryBananaJuice:
            return [.strawBerry: 10, .banana: 1]
        case .mangoJuice:
            return [.mango: 3]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}


