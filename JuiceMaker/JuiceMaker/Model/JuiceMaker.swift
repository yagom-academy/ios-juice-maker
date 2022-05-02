//
//  JuiceMaker - JuiceMaker.swift
//  Created by 수꿍, 바드. 
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func checkFruitAvailable(for juice: Juice) throws {
        try fruitStore.goToWarehouse(of: fruitStore.checkFruitKind(_:), juice: juice)
    }
    
    func checkPossibilityOfMaking(_ juice: Juice) throws {
        try fruitStore.checkStock(function: fruitStore.reduceStock(fruit:amount:), juice: juice)
    }
}
