//
//  JuiceMaker - JuiceMaker.swift
//  Created by Harry, kokkilE. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore = FruitStore.shared
    
    func makeJuice(for juice: Juice) throws {
        do {
            guard try fruitStore.isStocked(for: juice) else {
                throw JuiceMakerError.outOfStock
            }
        } catch JuiceMakerError.nonExistentFruit {
            print(JuiceMakerError.nonExistentFruit.errorMessage)
        }
        
        for ingrediant in juice.recipe {
            do {
                try fruitStore.subtractStock(fruit: ingrediant.key, quantity: ingrediant.value)
            } catch JuiceMakerError.nonExistentFruit {
                print(JuiceMakerError.nonExistentFruit.errorMessage)
            }
        }
    }
}
