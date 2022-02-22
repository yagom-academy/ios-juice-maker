//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
    func makeJuice(name: String, firstIngredient: Int, secondIngredient: Int?, name1: FruitStore.Fruit, name2: FruitStore.Fruit?) -> (Int, Int) {
        var remainCounts: (firstIngredient: Int, secondIngredient: Int)
        remainCounts.firstIngredient = name1.count - firstIngredient
        
        if let second = secondIngredient {
            remainCounts.secondIngredient = name2?.count ?? 0 - second
        } else {
            remainCounts.secondIngredient = 0
        }
        
        return remainCounts
    }
    
}
