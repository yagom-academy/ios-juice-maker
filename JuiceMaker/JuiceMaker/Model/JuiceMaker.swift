//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func make(juice menu: JuiceMenu) {
        do {
            let availableFruitAndAmountList = try menu.recipe.map { ingredient in
                guard let fruit = fruitStore.fruits.first(where: { $0.key == ingredient.fruit }) else {
                    // TODO: fruitStore에 fruit 없음
                    throw JuiceError.test
                }
                
                guard fruit.value - ingredient.amount >= 0 else {
                    // TODO: fruit stock 부족
                    throw JuiceError.test
                }
                
                return (fruit, ingredient.amount)
            }
            
            availableFruitAndAmountList.forEach { (fruit, amount) in
                fruitStore.subtract(fruit: fruit.key, amount: amount)
            }
        } catch {
            switch error {
            case JuiceError.test:
                print("test")
            default:
                print("default")
            }
        }
    }
}

enum JuiceError: Error {
    case test
}
