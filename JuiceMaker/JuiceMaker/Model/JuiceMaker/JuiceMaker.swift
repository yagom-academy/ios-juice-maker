//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

protocol JuiceMakerable {
    func make(of juice: Juice)
}

//MARK: 쥬스 메이커 타입
struct JuiceMaker: JuiceMakerable {
    let fruitStore = FruitStore()
    
    func make(of juice: Juice) {
        for (fruit, amount) in juice.requireIngredients() {
            print(fruit,amount)
            fruitStore.consume(fruit: fruit, for: amount)
        }
    }
}
