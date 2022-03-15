//
//  JuiceMaker - JuiceMaker.swift
//  Created by 원툴, 두두. 
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    var fruitStock: [Fruit: Int] {
        return fruitStore.fruitStock
    }
    
    func make(fruitJuice: Juice) throws {
        let recipe = fruitJuice.recipe
        
        try checkEnoughStock(recipe: recipe)
        deleteStock(from: recipe)
    }
    
    private func checkEnoughStock(recipe: [Fruit: Int]) throws {
        for (fruit, amount) in recipe {
            try fruitStore.checkStock(fruit: fruit, amount: amount)
        }
    }
    
    private func deleteStock(from recipe: [Fruit: Int]) {
        for (fruit, amount) in recipe {
            fruitStore.changeStock(fruit: fruit, amount: -amount)
        }
    }
    
    func changeStock(from changedValues: [Fruit: Int]) {
        for (fruit, amount) in changedValues {
            fruitStore.changeStock(fruit: fruit, amount: amount)
        }
    }
}
