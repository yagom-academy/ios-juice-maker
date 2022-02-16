//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore()
    
    func makeJuice(juice: Juice) -> Bool {
        return fruitStore.useFruit(fruits: juice.ingredient)
    }
}
