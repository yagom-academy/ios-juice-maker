//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore.shared
    
    func makeStrawberryJuice() {
        fruitStore.subtractStock(fruit: .strawberry, amount: 16)
    }
    
    func makeBananaJuice() {
        fruitStore.subtractStock(fruit: .banana, amount: 2)
    }
    
    func makeKiwiJuice() {
        fruitStore.subtractStock(fruit: .kiwi, amount: 3)
    }
    
    func makePineappleJuice() {
        fruitStore.subtractStock(fruit: .pineapple, amount: 2)
    }
    
    func makeStrawberryBananaJuice() {
        fruitStore.subtractStock(fruit: .strawberry, amount: 10)
        fruitStore.subtractStock(fruit: .banana, amount: 1)
    }
    
    func makeMangoJuice() {
        fruitStore.subtractStock(fruit: .mango, amount: 3)
    }
    
    func makeMangoKiwiJuice() {
        fruitStore.subtractStock(fruit: .mango, amount: 2)
        fruitStore.subtractStock(fruit: .kiwi, amount: 1)
    }
}
