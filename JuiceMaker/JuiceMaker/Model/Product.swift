//
//  Juice.swift
//  JuiceMaker
//
//  Created by 수꿍, 바드 on 2022/04/26.
//

enum Product {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
}

extension Product {
    var name: String {
        switch self {
        case .strawberryJuice:
            return "strawberryJuice"
        case .bananaJuice:
            return "bananaJuice"
        case .pineappleJuice:
            return "pineappleJuice"
        case .kiwiJuice:
            return "kiwiJuice"
        case .strawberryBananaJuice:
            return "strawberryBananaJuice"
        case .mangoJuice:
            return "mangoJuice"
        case .mangoKiwiJuice:
            return "mangoKiwiJuice"
        }
    }
}
