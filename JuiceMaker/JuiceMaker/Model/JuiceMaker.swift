//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    let fruitStore = FruitStore(initialStockNumber: 10)
    
    func make(_ fruitJuice: FruitJuice) {
        let ingredient = fruitJuice.ingredient
        var reducedList: [Fruit: Int] = [:]
        for (fruit, count) in ingredient {
            if fruitStore.checkFruit(name: fruit, count: count) {
                reducedList[fruit] = count
            } else {
                print("\(fruitJuice)주스 생성실패")
                return
            }
        }
        reducedList.forEach{ fruitStore.reduceStock(of: $0.key, count: $0.value) }
        print("\(fruitJuice)주스 생성성공")
    }
}
