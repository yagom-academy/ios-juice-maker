//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    var fruitStore: FruitStore = FruitStore()
    
    mutating func makeOrder(juice: Juice) {
        do {
            try fruitStore.decreaseIngredient(with: juice.recipe)
        } catch FruitStoreError.outOfStock(let fruit) {
            print("\(fruit)의 재고가 부족합니다.")
        } catch {
            print("알 수 없는 오류 발생.")
        }
    }
}
