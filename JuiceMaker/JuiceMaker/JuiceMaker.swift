//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by Tak on 2021/03/11.
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
    case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, mangoJuice, strawberryBananaJuice, mangoKiwiJuice
}

class JuiceMaker {
    func increaseFruit() {
    
    }
    func decreaseFruit() {
        
    }
    func consumeFruit() {
        
    }
    
    func makeJuice() {
        
    }
    func hasFruit() throws -> Bool {
        return true
    }
    func followRecipe(recipe: Juice) -> [Fruit: Int] {
        switch recipe {
        case .strawberryJuice:
            return [Fruit.strawberry: 16]
        case .bananaJuice:
            return [Fruit.banana: 2]
        case .kiwiJuice:
            return [Fruit.kiwi: 3]
        case .pineappleJuice:
            return [Fruit.pineapple: 2]
        case .mangoJuice:
            return [Fruit.mango: 3]
        case .strawberryBananaJuice:
            return [Fruit.strawberry: 10, Fruit.banana: 1]
        case .mangoKiwiJuice:
            return [Fruit.mango: 2, Fruit.kiwi: 1]
        }
    }
}
