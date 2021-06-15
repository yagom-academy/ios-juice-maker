//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let store = FruitStore()
    
    func makeJuice(_ juice: Juice) {
        do {
            try checkStock(juice.ingredients)
            
            for (fruit, removingQuantity) in juice.ingredients {
                store.changeStock(fruit, removingQuantity)
            }
            // success notification (juice.description)
        } catch {
            // fail notification (juice.description)
        }
    }
    
    func checkStock(_ ingredients: Dictionary<Fruit, Int>) throws {
        for (fruit, removingQuantity) in ingredients {
            if store.currentStock(fruit) < removingQuantity {
                throw JuiceMakerError.outOfStock
            }
        }
    }
}
