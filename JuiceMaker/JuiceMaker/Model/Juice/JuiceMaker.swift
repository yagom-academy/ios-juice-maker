//
//  JuiceMaker - JuiceMaker.swift
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore = FruitStore.shared
    
    mutating func makeJuice(of juice: Juice) throws {
        try chooseRecipe(order: juice)
        if fruitStore.insufficientStock.isEmpty {
            fruitStore.useStock(juice: juice)
        } else {
            throw StockError.outOfStock
        }
    }
    
    private mutating func chooseRecipe(order: Juice) throws {
        for (fruit, fruitAmount) in order.recipe {
            try fruitStore.checkFruitStock(fruit: fruit, amount: fruitAmount)
        }
    }
}
