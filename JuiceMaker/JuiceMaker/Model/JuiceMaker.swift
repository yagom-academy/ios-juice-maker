//
//  JuiceMaker - JuiceMaker.swift
//  Created by 수꿍, 바드. 
//  Copyright © yagom academy. All rights reserved.
// 

// 쥬스 메이커 타입
struct JuiceMaker {
    let juiceMakerStore = FruitStore()
    
    func make(_ juice: Product) {
        do {
            try checkPossibilityOfMaking(juice)
        } catch (let error) {
            juiceMakerStore.handle(error)
        }
    }
    
    private func checkPossibilityOfMaking(_ juice: Product) throws {
        try juiceMakerStore.checkStock(function: juiceMakerStore.reduceStock(fruit:amount:), juice: juice)
    }
}
