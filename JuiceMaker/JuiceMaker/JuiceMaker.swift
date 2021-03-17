//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by James & Tak on 2021/03/11.
//

import Foundation

enum JuiceMakerError:Error {
    case outOfStock
    case unknownError
    case unavailableAccess
}

enum Fruit {
    case strawberry, banana, kiwi, pineapple, mango
}

enum Juice: String {
    case strawberryJuice = "딸기주스"
    case bananaJuice = "바나나주스"
    case kiwiJuice = "키위주스"
    case pineappleJuice = "파인애플주스"
    case mangoJuice = "망고주스"
    case strawberryBananaJuice = "딸바주스"
    case mangoKiwiJuice = "망키주스"
    
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

class JuiceMaker {
    private var fruitRefrigerator = FruitStorage.shared.refrigerator
    
    func makeJuice(flavor juice: Juice) throws -> Bool {
        for (fruit, requirements) in juice.recipe {
            guard let stock = fruitRefrigerator[fruit] else {
                throw JuiceMakerError.unavailableAccess
            }
            if stock >= requirements {
                fruitRefrigerator.updateValue(stock - requirements, forKey: fruit)
            }
            else {
                throw JuiceMakerError.outOfStock
            }
        }
        return true
    }
}
