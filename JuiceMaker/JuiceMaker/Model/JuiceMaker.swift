//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
class JuiceMaker: FruitStore {
    enum FruitNumber: Int {
        case strawberry = 0
        case banana = 1
        case pineapple = 2
        case kiwi = 3
        case mango = 4
    }
    
    func makeJuice(JuiceName: String, firstIngredientCounts: Int, secondIngredientCounts: Int, firstIngredient: FruitNumber, secondIngredient: FruitNumber?) {
        fruitLists[firstIngredient.rawValue].count -= firstIngredientCounts
        if let fruitName2 = secondIngredient {
            fruitLists[fruitName2.rawValue].count -= secondIngredientCounts
        }
    }
}
