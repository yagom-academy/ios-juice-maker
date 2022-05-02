//
//  JuiceMaker - JuiceMaker.swift
//  Created by Kiwi, unchain123.
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func makeJuice(flavor: Juice) {
        let recipe = flavor.recipe
        
        do {
            try fruitStore.checkInventory(about: recipe)
            fruitStore.consumeFruitsStock(by: recipe)
        } catch FruitStoreError.outOfStock {
            print("재고가 없습니다")
        } catch {
            print("")
        }
    }
}
