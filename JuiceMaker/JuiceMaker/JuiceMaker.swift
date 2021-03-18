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
    fileprivate(set) var strawberry: Int = 10
    fileprivate(set) var banana: Int = 10
    fileprivate(set) var kiwi: Int = 10
    fileprivate(set) var pineapple: Int = 10
    fileprivate(set) var mango: Int = 10
}

class JuiceMaker {
    var fruitStock = FruitStock()
    
    private func checkFruitStock() {
        print("과일 재고 : 딸기 \(fruitStock.strawberry), 바나나 \(fruitStock.banana), 파인애플 \(fruitStock.pineapple), 키위 \(fruitStock.kiwi), 망고 \(fruitStock.mango)")
    }
    
    func addAmount(_ of: inout Int, as much: Int) {
        of = of + much
    }
    
    func subtractAmount(_ of: inout Int, as much: Int) {
        of = of - much
    }
    
    func canMakeJuice(amount: Int, subtract: Int) -> Bool {
        if amount >= subtract {
            return true
        } else {
            return false
        }
    }
    
    func recipeOfJuice(juice: FruitJuice) {
        switch juice {
        case .strawberryJuice:
            subtractAmount(&fruitStock.strawberry, as: 16)
        case .bananaJuice:
            subtractAmount(&fruitStock.banana, as: 2)
        case .kiwiJuice:
            subtractAmount(&fruitStock.kiwi, as: 3)
        case .pineappleJuice:
            subtractAmount(&fruitStock.pineapple, as: 2)
        case .strawberryBananaJuice:
            subtractAmount(&fruitStock.strawberry, as: 10)
            subtractAmount(&fruitStock.banana, as: 1)
        case .mangoJuice:
            subtractAmount(&fruitStock.mango, as: 3)
        case .mangoKiwiJuice:
            subtractAmount(&fruitStock.mango, as: 2)
            subtractAmount(&fruitStock.kiwi, as: 1)
        }
    }
    
    func manufactureJuice(of: FruitJuice) -> Bool {
        switch of {
        case .strawberryJuice where canMakeJuice(amount: fruitStock.strawberry, subtract: 16):
                recipeOfJuice(juice: .strawberryJuice)
            return true
        case .bananaJuice where canMakeJuice(amount: fruitStock.banana, subtract: 2):
                recipeOfJuice(juice: .bananaJuice)
            return true
        case .kiwiJuice where canMakeJuice(amount: fruitStock.kiwi, subtract: 3):
                recipeOfJuice(juice: .kiwiJuice)
            return true
        case .pineappleJuice where canMakeJuice(amount: fruitStock.pineapple, subtract: 2):
                recipeOfJuice(juice: .pineappleJuice)
            return true
        case .mangoJuice where canMakeJuice(amount: fruitStock.mango, subtract: 3):
                recipeOfJuice(juice: .mangoJuice)
            return true
        case .strawberryBananaJuice where canMakeJuice(amount: fruitStock.strawberry, subtract: 10) && canMakeJuice(amount: fruitStock.banana, subtract: 1):
                recipeOfJuice(juice: .strawberryBananaJuice)
            return true
        case .mangoKiwiJuice where canMakeJuice(amount: fruitStock.mango, subtract: 2) && canMakeJuice(amount: fruitStock.kiwi, subtract: 1):
                recipeOfJuice(juice: .mangoKiwiJuice)
            return true
        default:
            return false
        }
    }
}
