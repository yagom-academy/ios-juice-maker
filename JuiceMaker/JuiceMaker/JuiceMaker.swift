//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by James & Tak on 2021/03/11.
//

import Foundation

enum JuiceMakerError: Error {
    case outOfStock
    case unknownError
    case invalidAccess
}

enum Fruit {
    case strawberry, banana, kiwi, pineapple, mango
}

enum Juice: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case mangoJuice = "망고쥬스"
    case strawberryBananaJuice = "딸바쥬스"
    case mangoKiwiJuice = "망키쥬스"
    
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

extension Juice: CustomStringConvertible {
    var description: String {
        return rawValue
        }
    }

final class JuiceMaker {
    
    private func grindFruit(fruit: Fruit, amount: Int) {
        FruitStorage.shared.manageFruit(fruit: fruit, quantity: -amount)
    }
    
    func makeJuice(order: Juice) throws {
        for (ingredients, requirements) in order.recipe {
            if FruitStorage.shared.hasEnoughFruit(fruit: ingredients, requiredQuantity: requirements) {
                grindFruit(fruit: ingredients, amount: requirements)
            }
            else {
                throw JuiceMakerError.outOfStock
            }
        }
    }
}
