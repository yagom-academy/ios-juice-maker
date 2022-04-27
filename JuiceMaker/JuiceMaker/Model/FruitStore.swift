//
//  JuiceMaker - FruitStore.swift
//
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    
    private var stocks: [Fruits: Int] = [:]
    private let stock = 10
    init() {
        Fruits.allCases.forEach { stocks[$0] = stock }
    }
    
    func chooseRecipe(order: Juice) throws {
        for fruit in order.chooseJuice.keys {
            try checkFruitStock(juice: order, fruits: fruit)
        }
    }

    private func checkFruitStock(juice: Juice, fruits: Fruits) throws {
        guard let stockFruit = stocks[fruits] ,let needFruitAmount = juice.chooseJuice[fruits], stockFruit >= needFruitAmount else {
            throw StockError.outOfError
        }
        makeJuice(juice: juice, fruits: fruits)
    }
    
    private func makeJuice(juice: Juice, fruits: Fruits) {
        if let stockFruit = stocks[fruits] ,let requiredFruit = juice.chooseJuice[fruits] {
            stocks.updateValue(stockFruit - requiredFruit, forKey: fruits)
        }
    }
}
