//
//  JuiceMaker - JuiceMaker.swift
//  Created by Harry, kokkilE. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    func makeJuice(recipe: [Fruit: Int]) {
        guard fruitStore.isStocked(recipe: recipe) else {
            return
        }
        
        for ingrediant in recipe {
            fruitStore.subtractStock(fruit: ingrediant.key, amount: ingrediant.value)
        }
        //print(fruitStore.fruitStock)
    }
}
