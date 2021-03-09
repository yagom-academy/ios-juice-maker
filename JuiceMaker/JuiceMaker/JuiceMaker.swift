//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입
class JuiceMaker {
    func readFruitStock(fruit: Fruit) -> Int {
        let result: Int = fruit.stock
        
        return result
    }
    
    func makeFruitJuice(juice: Juice) {
        let recipe: [(Fruit, Int)] = juice.recipe

        for (fruit, needStock) in recipe {
            if fruit.stock < needStock {
                print("\(fruit)의 재고량 부족")
                break
            } else {
                fruit.minusStock(count: needStock)
            }
        }
    }
    
    func plusFruitStock(fruit: Fruit, addStock: Int) {
        fruit.plusStock(count: addStock)
    }
    
    func minusFruitStock(fruit: Fruit, revertStock: Int) {
        fruit.minusStock(count: revertStock)
    }
}
