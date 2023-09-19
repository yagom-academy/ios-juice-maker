//
//  Menu.swift
//  JuiceMaker
//
//  Created by hisop, morgan on 2023/09/12.
//

enum Menu: Int {
    case strawberryJuice = 1
    case bananaJuice = 2
    case pineappleJuice = 3
    case kiwiJuice = 4
    case mangoJuice = 5
    case strawberryBananaJuice = 6
    case mangoKiwiJuice = 7
    
    var menuToKorean: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .strawberryBananaJuice:
            return "딸바쥬스"
        case .mangoKiwiJuice:
            return "망키쥬스"
        }
    }
}

