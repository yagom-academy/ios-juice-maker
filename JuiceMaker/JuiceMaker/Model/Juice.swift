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
    
    func recipe() -> [(fruit: Fruit, count: Int)] {
        switch self {
        case .strawberryJuice:
            return [(fruit: Fruit.strawberry, count: 16)]
        case .bananaJuice:
            return [(fruit: Fruit.banana, count: 2)]
        case .kiwiJuice:
            return [(fruit: Fruit.kiwi, count: 3)]
        case .pineappleJuice:
            return [(fruit: Fruit.pineapple, count: 2)]
        case .mangoJuice:
            return [(fruit: Fruit.mango, count: 3)]
        case .strawberryBananaJuice:
            return [
                (fruit: Fruit.strawberry, count: 10),
                (fruit: Fruit.banana, count: 1)
            ]
        case .mangoKiwiJuice:
            return [
                (fruit: Fruit.mango, count: 2),
                (fruit: Fruit.kiwi, count: 1)
            ]
        }
    }
}
