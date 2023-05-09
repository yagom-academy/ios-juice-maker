//
//  Juice.swift
//  JuiceMaker
//
//  Created by Yetti, yy-ss99, Mary.
//

enum Juice: CustomStringConvertible {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    var description: String {
        switch self {
        case .strawberryJuice:
            return "딸기쥬스"
        case .bananaJuice:
            return "바나나쥬스"
        case .kiwiJuice:
            return "키위쥬스"
        case .pineappleJuice:
            return "파인애플쥬스"
        case .strawberryBananaJuice:
            return "딸기바나나쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .mangoKiwiJuice:
            return "망고키위쥬스"
        }
    }
}
