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
        } catch FruitStoreError.invalidFruitInput {
            print("FruitStoreError.invalidFruitInput")
        }
        
        for ingrediant in juice.recipe {
            do {
                try fruitStore.subtractStock(fruit: ingrediant.key, quantity: ingrediant.value)
            } catch FruitStoreError.invalidFruitInput {
                print("FruitStoreError.invalidFruitInput")
            } catch FruitStoreError.belowZeroQuantity {
                print("FruitStoreError.belowZeroAmount")
            }
        }
    }
}
