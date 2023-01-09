//
//  JuiceMaker - FruitStore.swift
//  Created by riji, kaki
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    var fruitStocks: [Fruit: Int] = [:]
    
    init(initialStock: Int = 10) {
        Fruit.allCases.forEach { fruitStocks[$0] = initialStock }
    }
    
    func addStock(of fruit: Fruit, amount: Int) throws {
        guard let fruitStock = fruitStocks[fruit] else {
            throw JuiceMakerError.fruitError
        }
        fruitStocks[fruit] = fruitStock + amount
        
        try checkOutStock(of: fruit)
    }
    
    func subtractStock(of fruit: Fruit, amount: Int) throws {
        guard let fruitStock = fruitStocks[fruit], fruitStock >= amount else {
            throw JuiceMakerError.outOfStock
        }
        fruitStocks[fruit] = fruitStock - amount
        
        try checkOutStock(of: fruit)
    }
    
    private func checkOutStock(of fruit: Fruit) throws {
        guard let fruitStock = fruitStocks[fruit] else {
            throw JuiceMakerError.fruitError
        }
        print("\(fruit)의 재고는 \(fruitStock)개 입니다.")
    }
}
