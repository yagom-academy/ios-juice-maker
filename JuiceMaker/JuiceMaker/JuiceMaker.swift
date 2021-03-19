//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// ddsd

import Foundation

enum FruitJuice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
}

class FruitStock {
    static var shared = FruitStock()
    fileprivate(set) var strawberry: Int = 10
    fileprivate(set) var banana: Int = 10
    fileprivate(set) var kiwi: Int = 10
    fileprivate(set) var pineapple: Int = 10
    fileprivate(set) var mango: Int = 10
}

class JuiceMaker {
    func addAmount(_ of: inout Int, as much: Int) {
        of = of + much
    }
    
    func subtractAmount(_ of: inout Int, as much: Int) {
        of = of - much
    }
    
    func compareStock(amount: Int, subtract: Int) -> Bool {
        if amount >= subtract {
            return true
        } else {
            return false
        }
    }
    
    func recipeOfJuice(juice: FruitJuice) {
        switch juice {
        case .strawberryJuice:
            subtractAmount(&FruitStock.shared.strawberry, as: 16)
        case .bananaJuice:
            subtractAmount(&FruitStock.shared.banana, as: 2)
        case .kiwiJuice:
            subtractAmount(&FruitStock.shared.kiwi, as: 3)
        case .pineappleJuice:
            subtractAmount(&FruitStock.shared.pineapple, as: 2)
        case .strawberryBananaJuice:
            subtractAmount(&FruitStock.shared.strawberry, as: 10)
            subtractAmount(&FruitStock.shared.banana, as: 1)
        case .mangoJuice:
            subtractAmount(&FruitStock.shared.mango, as: 3)
        case .mangoKiwiJuice:
            subtractAmount(&FruitStock.shared.mango, as: 2)
            subtractAmount(&FruitStock.shared.kiwi, as: 1)
        }
    }
    
    func serveJuice(of: FruitJuice) {
        switch of {
        case .strawberryJuice where compareStock(amount: FruitStock.shared.strawberry, subtract: 16):
                recipeOfJuice(juice: .strawberryJuice)
        case .bananaJuice where compareStock(amount: FruitStock.shared.banana, subtract: 2):
                recipeOfJuice(juice: .bananaJuice)
        case .kiwiJuice where compareStock(amount: FruitStock.shared.kiwi, subtract: 3):
                recipeOfJuice(juice: .kiwiJuice)
        case .pineappleJuice where compareStock(amount: FruitStock.shared.pineapple, subtract: 2):
                recipeOfJuice(juice: .pineappleJuice)
        case .mangoJuice where compareStock(amount: FruitStock.shared.mango, subtract: 3):
                recipeOfJuice(juice: .mangoJuice)
        case .strawberryBananaJuice where compareStock(amount: FruitStock.shared.strawberry, subtract: 10) && compareStock(amount: FruitStock.shared.banana, subtract: 1):
                recipeOfJuice(juice: .strawberryBananaJuice)
        case .mangoKiwiJuice where compareStock(amount: FruitStock.shared.mango, subtract: 2) && compareStock(amount: FruitStock.shared.kiwi, subtract: 1):
                recipeOfJuice(juice: .mangoKiwiJuice)
        default:
            return
        }
    }
    
    func canMakeJuice(of: FruitJuice) -> Bool {
        switch of {
        case .strawberryJuice where compareStock(amount: FruitStock.shared.strawberry, subtract: 16):
            return true
        case .bananaJuice where compareStock(amount: FruitStock.shared.banana, subtract: 2):
            return true
        case .kiwiJuice where compareStock(amount: FruitStock.shared.kiwi, subtract: 3):
            return true
        case .pineappleJuice where compareStock(amount: FruitStock.shared.pineapple, subtract: 2):
            return true
        case .mangoJuice where compareStock(amount: FruitStock.shared.mango, subtract: 3):
            return true
        case .strawberryBananaJuice where compareStock(amount: FruitStock.shared.strawberry, subtract: 10) && compareStock(amount: FruitStock.shared.banana, subtract: 1):
            return true
        case .mangoKiwiJuice where compareStock(amount: FruitStock.shared.mango, subtract: 2) && compareStock(amount: FruitStock.shared.kiwi, subtract: 1):
            return true
        default:
            return false
        }
    }
}
