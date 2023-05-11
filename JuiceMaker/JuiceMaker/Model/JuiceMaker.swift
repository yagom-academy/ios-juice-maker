//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    func make(_ juice: Juice) {
        do {
            try fruitStore.checkStock(with: juice)
            fruitStore.decreaseStock(with: juice)
        } catch FruitStoreError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print(error)
        }
    }
}
