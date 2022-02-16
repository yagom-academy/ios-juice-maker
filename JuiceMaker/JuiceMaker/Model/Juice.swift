//
//  Juice.swift
//  JuiceMaker
//
//  Created by 이지원 on 2022/02/15.
//

import Foundation

enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    func recipe() -> Recipe {
        switch self {
        case .strawberryJuice:
            return Recipe(materials: [
                Material(fruit: .strawberry, count: 16)
            ])
        case .bananaJuice:
            return Recipe(materials: [
                Material(fruit: .banana, count: 2)
            ])
        case .kiwiJuice:
            return Recipe(materials: [
                Material(fruit: .kiwi, count: 3)
            ])
        case .pineappleJuice:
            return Recipe(materials: [
                Material(fruit: .pineapple, count: 2)
            ])
        case .mangoJuice:
            return Recipe(materials: [
                Material(fruit: .mango, count: 3)
            ])
        case .strawberryBananaJuice:
            return Recipe(materials: [
                Material(fruit: .strawberry, count: 10),
                Material(fruit: .banana, count: 1)
            ])
        case .mangoKiwiJuice:
            return Recipe(materials: [
                Material(fruit: .mango, count: 2),
                Material(fruit: .kiwi, count: 1)
            ])
        }
    }
}
