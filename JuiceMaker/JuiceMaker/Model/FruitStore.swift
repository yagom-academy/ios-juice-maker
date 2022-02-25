//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    private var stocks: [Fruit: Int]

    init(stocks: [Fruit : Int] = Fruit.configureDefaultFruits()) {
        self.stocks = stocks
    }
    
    func consume(fruit: Fruit, amount: Int) throws {
        let oldAmount = try checkStock(of: fruit)
        let newAmount = oldAmount - amount
        stocks.updateValue(newAmount, forKey: fruit)
    }
    
    func checkEnoughStocks(recipe: Constant.CustomType.Recipe) throws {
        for (fruit, requiredAmount) in recipe {
            try checkEnoughStock(of: fruit, amount: requiredAmount)
        }
    }
    
    private func checkEnoughStock(of fruit: Fruit, amount: Int) throws {
        let remainingAmount = try checkStock(of: fruit)
        
        guard remainingAmount >= amount else {
            throw JuiceMakerError.notEnoughFruitAmount(fruit: fruit.rawValue)
        }
    }
    
    private func checkStock(of fruit: Fruit) throws -> Int {
        guard let remainingAmount = stocks[fruit] else {
            throw JuiceMakerError.notFoundFruit
        }
        
        return remainingAmount
    }
}
