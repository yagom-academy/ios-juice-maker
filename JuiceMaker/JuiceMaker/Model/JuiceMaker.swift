//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private var fruitStore: FruitStore = FruitStore()
    
    func makeJuice(juice: Juice) -> JuiceMakeResult {
        if fruitStore.canMakeJuice(juice: juice) {
            fruitStore.useFruit(juice: juice)
            return .success
        }
        return .notEnoughFruit
    }
}
