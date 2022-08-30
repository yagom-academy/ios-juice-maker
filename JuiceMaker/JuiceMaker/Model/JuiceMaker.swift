//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore()
    
    func make(juice: Juice) throws {
        do {
            try fruitStore.reduceInventory(of: juice.recipe)
        } catch {
            throw error
        }
    }
}
