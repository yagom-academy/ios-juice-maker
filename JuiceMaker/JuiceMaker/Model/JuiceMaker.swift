//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var store = FruitStore()
    
    func makeJuice(_ juice: Juice) {
        for (ingredient, count) in juice.name {
            store.changeInventory(ingredient, count)
        }
    }
}
