//
//  JuiceMaker - FruitStore.swift
//
//  Created by bradheo65, bonf, ZZBAE
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    
    static let shared = FruitStore()
    let defaultFruitStock:Int = 10
    
    private init() {
        Fruit.allCases.forEach { stocks[$0] = defaultFruitStock }
    }
    
    var stocks: [Fruit: Int] = [:]
    var insufficientStock: [Fruit: Int] = [:]
    
    func checkFruitStock(fruit: Fruit, amount: Int) throws {
        guard let stockFruit = stocks[fruit] else { throw StockError.defaultError }
        guard stockFruit >= amount else {
            return insufficientStock[fruit] = amount - stockFruit
        }
    }
    
    func useStock(juice: Juice) {
        for (fruit, fruitAmount) in juice.recipe {
            if let stockFruit = stocks[fruit] {
                stocks.updateValue(stockFruit - fruitAmount, forKey: fruit)
            }
        }
    }
}

