//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    var fruitStore: FruitStore = FruitStore()
    
    mutating func makeOrder(_ juice: Juice) {
        do {
            for ingredient in juice.recipe {
                try fruitStore.checkStock(witch: ingredient.name, by: ingredient.quantity)
            }
            
            juice.recipe.forEach { fruitStore.decreaseStock(witch: $0.name, by: $0.quantity) }
            print("주문하신 \(juice.recipe[0].name) 나왔습니다.")
        } catch FruitStoreError.outOfStock(let fruit) {
            print("\(fruit)의 재고가 부족합니다.")
        } catch {
            print("알 수 없는 오류 발생.")
        }
    }
}
