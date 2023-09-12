//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
struct FruitStore {
    private var fruitList: [String:Int] = [:]
    
    func minusIngredient(fruit: String, quantity: Int) {
        
    }
    
    func plusIngredient(fruit: String, quantity: Int) {
        
    }
    
    func checkIngredient(fruit: String, quantity: Int) -> Bool {
        guard let IngredientQuantity = fruitList[fruit] else {
            return false
        }
        guard IngredientQuantity > quantity else {
            return false
        }
        return true
    }
    
    init(ingredientQuantity: Int) {
        fruitList["딸기"] = ingredientQuantity
        fruitList["바나나"] = ingredientQuantity
        fruitList["파인애플"] = ingredientQuantity
        fruitList["키위"] = ingredientQuantity
        fruitList["망고"] = ingredientQuantity
    }
}
