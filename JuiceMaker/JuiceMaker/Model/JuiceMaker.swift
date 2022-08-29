//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
class JuiceMaker {
    var fruitStore = FruitStore()
    var juiceList: [FruitJuice: Int] = [.strawberryJuice: 0, .bananaJuice: 0, .kiwiJuice: 0, .pineappleJuice: 0, .mangoJuice: 0, .strawberryBananaJuice: 0, .mangoKiwiJuice: 0]
    
    func makeFruitJuice(fruit: FruitJuice) {
        switch fruit {
        case .strawberryJuice:
            requestFruitJuice(fruit: Fruits.strawberry, juice: .strawberryJuice)
        case .bananaJuice:
            requestFruitJuice(fruit: Fruits.banana, juice: .bananaJuice)
        case .kiwiJuice:
            requestFruitJuice(fruit: Fruits.kiwi, juice: .kiwiJuice)
        case .pineappleJuice:
            requestFruitJuice(fruit: Fruits.pineapple, juice: .pineappleJuice)
        case .mangoJuice:
            requestFruitJuice(fruit: Fruits.mango, juice: .mangoJuice)
//        case .strawberryBananaJuice:
//            requestFruitJuice(fruit: fruit)
//        case .mangoKiwiJuice:
//            requestFruitJuice(fruit: fruit)
        default:
            return
        }
    }
    
    func requestFruitJuice(fruit: Fruits, juice: FruitJuice) {
        fruitStore.changeAmountOfFruits(fruit: fruit, amount: 100)
        fruitStore.distinguishAmountOfFruits(fruit: fruit, juice: juice)
    }
        
}
