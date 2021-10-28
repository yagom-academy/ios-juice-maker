//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore = FruitStore(initialStock: 10)
    
    enum JuiceMakerError: Error {
        case outOfStock
    }
    
    func make(_ seletedJuice: Menu) throws {
        let recipe: [Fruit : Int] = seletedJuice.recipe
        
        guard fruitStore.isRemaining(of: recipe) else {
            throw JuiceMakerError.outOfStock
        }
        
        for (fruit, count) in recipe {
            fruitStore.changeQuantity(of: fruit, count: count, by: .subtraction)
        }
    }
    
    func checkFruitStock() -> [Fruit: String] {
        return fruitStore.fruitStock.mapValues { String($0) }
    }
}

