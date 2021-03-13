//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by James & Tak on 2021/03/11.
//

import Foundation

enum AppError:Error {
    case outOfStock
    case unknownError
}

enum Fruit {
    case strawberry, banana, kiwi, pineapple, mango
}
enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
    
    var recipe: [Fruit : Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry : 16]
        case .bananaJuice:
            return [.banana : 2]
        case .kiwiJuice:
            return [.kiwi : 3]
        case .pineappleJuice:
            return [.pineapple : 2]
        case .strawberryBananaJuice:
            return [.strawberry : 10, .banana: 1]
        case .mangoJuice:
            return [.mango : 3]
        case .mangoKiwiJuice:
            return [.mango : 2, .kiwi : 1]
            
        }
    }
}

extension Juice: CustomStringConvertible {
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
            return "딸바쥬스"
        case .mangoJuice:
            return "망고쥬스"
        case .mangoKiwiJuice:
            return "망키쥬스"
        }
    }
}


class JuiceMaker {
    var fruitStorage = FruitStorage.shared.refrigerator
    
    func increaseFruit(input: Fruit) throws {
        guard let stock = fruitStorage[input] else {
            throw AppError.unknownError
        }
        fruitStorage.updateValue(stock + 1, forKey: input)
    }
    
    func decreaseFruit(input: Fruit) throws {
        guard let stock = fruitStorage[input], stock > 0 else {
            throw AppError.unknownError
        }
        fruitStorage.updateValue(stock - 1, forKey: input)
    }
    
    func executeJuiceMaker(juice: Juice) {
        do {
            try makeJuice(for: juice)
        } catch {
        }
    }
    
    func makeJuice(for juice: Juice) throws -> Bool {
        for (fruit, requirements) in juice.recipe {
            guard let stock = fruitStorage[fruit]
            else {
                throw AppError.unknownError
            }
            if stock >= requirements {
                fruitStorage.updateValue(stock - requirements, forKey: fruit)
            }
            else {
                throw AppError.outOfStock
            }
        }
        return true
    }
}
