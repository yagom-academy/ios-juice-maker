//
//  JuiceMaker - FruitStore.swift
//  Created by 추니 & Davy.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    var store: [Fruit: Int] = Fruit.allCases.reduce(into: [:]) { store, fruit in
        store[fruit] = Fruit.initialCount
    }
    
    func changeAmountOfFruit(_ fruits: [Recipe]) throws {
        var temporaryResult: [Recipe] = []
        
        try fruits.forEach {
            guard let fruitStock = store[$0.fruit] else {
                throw FruitError.nonExistentFruit
            }
            
            if fruitStock + $0.amount < 0 {
                throw FruitError.outOfStock
            }
            
            let recipe = Recipe(fruit: $0.fruit, amount: $0.amount + fruitStock)
            temporaryResult.append(recipe)
        }
        
        if temporaryResult.count == fruits.count {
            updateFruit(temporaryResult)
        }
    }
    
    func updateAmountOfFruit(_ fruit: Recipe) {
        store[fruit.fruit] = fruit.amount
    }
    
    private func updateFruit(_ fruits: [Recipe]) {
        fruits.forEach {
            store[$0.fruit] = $0.amount
        }
    }
}
