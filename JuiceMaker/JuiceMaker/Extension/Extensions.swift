//
//  Extensions.swift
//  JuiceMaker
//
//  Created by 추니 & Davy.
//

import Foundation

extension String {
    func convertJuiceType() -> Juice {
        switch self {
        case Juice.strawberryBananaJuice.name:
            return .strawberryBananaJuice
        case Juice.mangoKiwiJuice.name:
            return .mangoKiwiJuice
        case Juice.strawberryJuice.name:
            return .strawberryJuice
        case Juice.bananaJuice.name:
            return .bananaJuice
        case Juice.pineappleJuice.name:
            return .pineappleJuice
        case Juice.kiwiJuice.name:
            return .kiwiJuice
        case Juice.mangoJuice.name:
            return .mangoJuice
        default:
            return .kiwiJuice
        }
    }
}
