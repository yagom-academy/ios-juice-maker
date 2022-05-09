//
//  JuiceMaker - JuiceMaker.swift
//  Created by Kiwi, unchain123.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    func canMakeJuice(flavor: Juice) -> Bool {
        let recipe = flavor.recipe
        
        do {
            try fruitStore.checkInventory(about: recipe)
            fruitStore.consumeFruitsStock(by: recipe)
            return true
        } catch FruitStoreError.outOfStock {
            print("재고가 없습니다")
            return false
        } catch {
            return true
        }
    }
}
