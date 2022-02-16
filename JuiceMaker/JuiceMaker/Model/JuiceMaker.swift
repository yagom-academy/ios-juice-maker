//
//  JuiceMaker - JuiceMaker.swift
//  Created by 추니 & Davy.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
}

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    func makeJuice(juice: Juice) -> String {
        switch juice {
        case .strawberryJuice:
            return validateMakeJuice(fruits: [(Fruit.strawberry, -16)])
        case .bananaJuice:
            return validateMakeJuice(fruits: [(Fruit.banana, -2)])
        case .kiwiJuice:
            return validateMakeJuice(fruits: [(Fruit.kiwi, -3)])
        case .pineappleJuice:
            return validateMakeJuice(fruits: [(Fruit.pineapple, -2)])
        case .strawberryBananaJuice:
            return validateMakeJuice(fruits: [(Fruit.strawberry, -10), (Fruit.banana, -1)])
        case .mangoJuice:
            return validateMakeJuice(fruits: [(Fruit.mango, -3)])
        case .mangoKiwiJuice:
            return validateMakeJuice(fruits: [(Fruit.mango, -2), (Fruit.kiwi, -1)])
        }
    }
    
    private func validateMakeJuice(fruits: [(Fruit, Int)]) -> String {
        do {
            try fruitStore.changeAmountOfFruit(fruits: fruits)
            return "성공"
        } catch let error as FruitError {
            return error.description
        } catch {
            return error.localizedDescription
        }
    }
}
