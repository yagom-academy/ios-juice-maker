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
        return .fail(needFruits: []) //TODO: 부족한 과일 종류 전달 필요함
    }
}
