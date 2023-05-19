//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    let fruitStore: FruitStore = FruitStore.shared
    
    mutating func make(_ juice: Juice) -> Bool {
        
        do {
            try fruitStore.checkStock(with: juice.recipe)
            fruitStore.changeStock(with: juice.recipe)
            return true
        } catch FruitStoreError.outOfStock {
            print("재고가 부족합니다.")
            return false
        } catch {
            print(error)
            return false
        }
    }
}
