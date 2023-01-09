//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    let fruitStore = FruitStore.shared
    
    func make(_ fruitJuice: FruitJuice) throws {
        let ingredient = fruitJuice.ingredient
        var reducedList: [Fruit: Int] = [:]
        for (fruit, count) in ingredient {
            if fruitStore.checkFruit(name: fruit, count: count) {
                reducedList[fruit] = count
            } else {
                throw juiceMakeError.outOfStock
            }
        }
        reducedList.forEach { fruitStore.reduceStock(of: $0.key, count: $0.value) }
    }
}
