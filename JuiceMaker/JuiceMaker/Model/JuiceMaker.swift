//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(juice: Juice) {
        do {
            let juiceRecipes = juice.recipe

            for (fruitName, count) in juiceRecipes {
                let stock = try fruitStore.getFruitStock(on: fruitName)
                
                guard stock > count else {
                    print(Message.outOfStock)
                    return
                }
            }
            try fruitStore.useStocks(with: juiceRecipes)
            Message.completeMakingJuice(on: juice)
        } catch {
            print("JuiceMakerError")
        }
    }
}
