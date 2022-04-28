//
//  JuiceMaker - FruitStore.swift
//
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    
    var stocks: [Fruit: Int] = [:]
    
    init(defaultFruitStock: Int) {
        Fruit.allCases.forEach { stocks[$0] = defaultFruitStock }
    }

    func chooseRecipe(order: Juice) throws {
        for fruit in order.recipeOfJuice.keys {
            try checkFruitStock(juice: order, fruits: fruit)
        }
    }

    private func checkFruitStock(juice: Juice, fruits: Fruit) throws {
        guard let stockFruit = stocks[fruits],
              let needFruitAmount = juice.recipeOfJuice[fruits],
              stockFruit >= needFruitAmount else {
            throw StockError.outOfStock
        }
        useStock(juice: juice, fruits: fruits)
    }
    
    private func useStock(juice: Juice, fruits: Fruit) {
        if let stockFruit = stocks[fruits],
           let requiredFruit = juice.recipeOfJuice[fruits] {
            stocks.updateValue(stockFruit - requiredFruit, forKey: fruits)
        }
    }
}
