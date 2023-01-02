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
}
