//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    func makeJuice(_ juice: Juice) throws {
        let ingredient = juice.ingredients
        
        for (fruit, amount) in ingredient {
            try fruitStore.useFruits(amount, to: fruit)
        }
    }
}
