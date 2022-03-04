//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

protocol Observer {
    func updateStockLabels()
}

final class FruitStore {
    private var observer: Observer?
    private(set) var stocks: [Fruit: Int] {
        didSet {
            notify()
        }
    }

    init(stocks: [Fruit : Int]) {
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
            throw JuiceMakerError.notEnoughFruitAmount
        }
    }
    
    private func checkStock(of fruit: Fruit) throws -> Int {
        guard let remainingAmount = stocks[fruit] else {
            throw JuiceMakerError.notFoundFruit
        }
        
        return remainingAmount
    }
}

extension FruitStore {
    func subscribe(observer: Observer) {
        self.observer = observer
    }
    
    func unSubscribe(observer: Observer) {
        self.observer = nil
    }
    
    private func notify() {
        observer?.updateStockLabels()
    }
}
