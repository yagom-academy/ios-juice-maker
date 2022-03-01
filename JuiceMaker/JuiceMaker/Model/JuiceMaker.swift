//
//  JuiceMaker - JuiceMaker.swift
//  Created by Doogie & Malrang. 
//  Copyright © yagom academy. All rights reserved.
// 
struct JuiceMaker {
    let store = FruitStore()
    
    func checkStock(menu: Menu) throws {
        for (ingredent, amount) in menu.recipe {
            guard let stock = store.fruitList[ingredent] else {
                throw FruitStoreError.invalidSelection
            }
            guard amount <= stock else {
                throw FruitStoreError.outOfStock
            }
        }
        
        for (ingredent, amount) in menu.recipe {
            try store.calculateStock(fruit: ingredent, amount: amount, calculationType: .minus)
        }
    }
}

