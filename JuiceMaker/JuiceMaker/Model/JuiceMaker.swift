//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private let fruitStore: FruitStore
    var getFruitStore: FruitStore {
        return fruitStore
    }
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(juice: Juice) throws {
        let juiceRecipes = juice.recipe
        
        for juiceRecipe in juiceRecipes {
            guard try fruitStore.hasEnoughStock(of: juiceRecipe) else {
                throw JuiceMakerError.outOfStock
            }
        }
        try fruitStore.useStocks(with: juiceRecipes)
    }
}
