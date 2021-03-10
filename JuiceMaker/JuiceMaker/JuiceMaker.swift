//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class JuiceMaker {
    func returnFruitStock(fruit: Fruit) -> Int {
        let result: Int = fruit.stock
        
        return result
    }
    
    func makeFruitJuice(juice: Juice) -> String {
        let recipe: [(Fruit, Int)] = juice.recipe
        var messege: String = ""
        
        for (fruit, needStock) in recipe {
            if fruit.stock < needStock {
                messege = "재료가 모자라요. 재고를 수정할까요?"
                break
            } else {
                fruit.minusStock(count: needStock)
                messege = "\(juice) 쥬스 나왔습니다! 맛있게 드세요!"
            }
        }
        
        return messege
    }
    
    func plusFruitStock(fruit: Fruit, addStock: Int) {
        fruit.plusStock(count: addStock)
    }
    
    func minusFruitStock(fruit: Fruit, revertStock: Int) {
        fruit.minusStock(count: revertStock)
    }
}
