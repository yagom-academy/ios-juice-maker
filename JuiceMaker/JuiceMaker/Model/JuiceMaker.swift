//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker { // 주문받기, 쥬스만들기, 필요한 과일 개수 확인, 재고랑 비교하기
    private var fruitStore: FruitStore
    
    init(store: FruitStore) {
        self.fruitStore = store
    }
    
    mutating func makeJuice(_ juice: Juice) throws {
        for (fruit, amount) in juice.recipe {
            if !fruitStore.compareAmount(fruit, with: amount) {
                try fruitStore.increaseFruitStock(fruit, amount: amount)
            } else {
                try fruitStore.decreaseFruitStock(fruit, amount: amount)
                print("\(juice.name) 쥬스가 완성되었습니다.")
            }
        }
    }
}
