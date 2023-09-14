//
//  JuiceMaker - FruitStore.swift
//  Created by hisop, morgan on 2023/09/13.
//  Copyright © yagom academy. All rights reserved.
//

struct FruitStore {
    private var fruitList = [Fruit: Int]()
    
    mutating func reduceStock(fruit: Fruit, quantity: Int) {
        guard let stock = fruitList[fruit] else {
            return
        }
        
        fruitList[fruit] = stock - quantity
    }
    
    func checkIngredientStock(recipe: [Fruit: Int]) -> Bool {
        for (fruit, quantity) in recipe {
            guard let stock = fruitList[fruit] else {
                return false
            }
            
            guard stock >= quantity else {
                return false
            }
        }
        return true
    }
    
    init(stock: Int) {
        fruitList[.strawberry] = stock
        fruitList[.banana] = stock
        fruitList[.pineapple] = stock
        fruitList[.kiwi] = stock
        fruitList[.mango] = stock
    }
}

