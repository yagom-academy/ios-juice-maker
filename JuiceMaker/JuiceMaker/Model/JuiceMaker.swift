//
//  JuiceMaker - JuiceMaker.swift
//  Created by 수꿍, 바드. 
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func make(_ juice: Juice) {
        do {
            try checkFruitAvailable(for: juice)
            try checkPossibilityOfMaking(juice)
        } catch (let error) {
            fruitStore.handle(error)
        }
    }
    
    private func checkFruitAvailable(for juice: Juice) throws {
        try fruitStore.goToWarehouse(of: fruitStore.checkFruitKind(_:), juice: juice)
    }
    
    private func checkPossibilityOfMaking(_ juice: Juice) throws {
        try fruitStore.checkStock(function: fruitStore.reduceStock(fruit:amount:), juice: juice)
    }
}
