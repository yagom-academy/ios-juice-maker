//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func makeJuice(_ juice: Juice) {
        do {
            try checkStock(juice.ingredients)
            
            for (fruit, removingQuantity) in juice.ingredients {
                fruitStore.changeStock(fruit, removingQuantity)
            }
            NotificationCenter.default.post(name: Notification.Name(rawValue: "makeJuiceSuccess"), object: nil, userInfo: ["쥬스이름": juice.description])
        } catch {
            NotificationCenter.default.post(name: Notification.Name(rawValue: "makeJuiceFail"), object: nil)
        }
    }
    func checkStock(_ ingredients: Dictionary<Fruit, Int>) throws {
        for (fruit, removingQuantity) in ingredients {
            if fruitStore.currentStock(fruit) < removingQuantity {
                throw JuiceMakerError.outOfStock
            }
        }
    }
}
