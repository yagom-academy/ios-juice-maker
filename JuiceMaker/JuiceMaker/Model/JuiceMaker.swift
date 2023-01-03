//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    let fruitStore = FruitStore(number: 10)
    
    func make(_ fruitJuice: FruitJuice) {
        let ingredient = fruitJuice.ingredient
        for (fruit, count) in ingredient {
            if fruitStore.checkFruit(name: fruit, count: count) {
                fruitStore.reduceStock(of: fruit, count: count)
            } else {
                print("\(fruitJuice)주스 생성실패")
                return
            }
        }
        print("\(fruitJuice)주스 생성성공")
    }
}
