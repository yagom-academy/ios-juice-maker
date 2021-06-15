//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    let store = FruitStore.shared
    
    func makeJuice(_ juice: Juice) {
        do {
            try checkStock(juice.ingredients)
            for (fruit, removingQuantities) in juice.ingredients {
                store.changeStock(fruit, removingQuantities)
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "successAlert"), object: nil, userInfo: ["쥬스이름":juice.description])
        } catch {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "failAlert"), object: nil)
        }
    }
    
    func checkStock(_ ingredients: [(Fruit, Int)]) throws {
        for (fruit, removingQuantities) in ingredients {
            do {
                if store.currentStock(fruit) < removingQuantities {
                    throw JuiceMakerError.outOfStock
                }
            }
        }
    }
}
