//
//  JuiceMaker - JuiceMaker.swift
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    let fruitStore = FruitStore(defaultFruitStock: 10)
    var insufficientStock: [Fruit:Int] = [:]
    
    mutating func makeJuice(of juice: Juice) throws {
        try chooseRecipe(order: juice)
    }
    
    private mutating func chooseRecipe(order: Juice) throws {
        for (fruit, fruitAmount) in order.recipeOfJuice {
            try checkFruitStock(fruit: fruit, amount: fruitAmount)
        }
        if insufficientStock.isEmpty {
            useStock(juice: order)
        } else {
            throw StockError.outOfStock
        }
    }
    
    private mutating func checkFruitStock(fruit: Fruit, amount: Int) throws {
        guard let stockFruit = fruitStore.stocks[fruit] else { throw StockError.outOfStock }
        guard stockFruit >= amount else {
            return insufficientStock[fruit] = amount - stockFruit
        }
    }
    
    private func useStock(juice: Juice) {
        for (fruit, fruitAmount) in juice.recipeOfJuice {
            if let stockFruit = fruitStore.stocks[fruit] {
                fruitStore.stocks.updateValue(stockFruit - fruitAmount, forKey: fruit)
            }
        }
    }
}
