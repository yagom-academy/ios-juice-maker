//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct FruitStore {
    private var fruitList: [String:Int] = [:]
    
    mutating func changeQuantity(fruit: String, quantity: Int) {
        guard fruitList[fruit] != nil else {
            return
        }
        fruitList[fruit] = quantity
    }
    
    func checkIngredient(fruit: String, quantity: Int) -> Bool {
        guard let ingredientQuantity = fruitList[fruit] else {
            return false
        }
        guard ingredientQuantity > quantity else {
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
