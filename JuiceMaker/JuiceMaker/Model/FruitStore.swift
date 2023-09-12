//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

struct FruitStore {
    private var fruitList: [Fruit: Int] = [:]
    
    mutating func changeQuantity(fruit: Fruit, quantity: Int) {
        guard fruitList[fruit] != nil else {
            return
        }
        fruitList[fruit] = quantity
    }
    
    func checkIngredient(recipe: [Fruit: Int]) -> Bool {
        for (fruit, quantity) in recipe {
            guard let ingredientQuantity = fruitList[fruit] else {
                return false
            }
            guard ingredientQuantity > quantity else {
                return false
            }
        }
        return true
    }
    
    init(ingredientQuantity: Int) {
        fruitList[.strawberry] = ingredientQuantity
        fruitList[.banana] = ingredientQuantity
        fruitList[.pineapple] = ingredientQuantity
        fruitList[.kiwi] = ingredientQuantity
        fruitList[.mango] = ingredientQuantity
    }
}

