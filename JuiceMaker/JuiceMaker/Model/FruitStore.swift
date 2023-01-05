//
//  JuiceMaker - FruitStore.swift
//  Created by riji, kaki. 
//  Copyright © yagom academy. All rights reserved.
//

class FruitStore {
    private var fruitStocks: [Fruits: Int] = [:]
    
    init(initialStock: Int = 10) {
        Fruits.allCases.forEach { fruitStocks[$0] = initialStock }
    }
    
    func addStock(of fruit: Fruits, amount: Int) throws {
        guard let fruitStock = fruitStocks[fruit] else {
            throw JuiceMakerError.fruitError
        }
        fruitStocks[fruit] = fruitStock + amount
        
        try checkOutStock(of: fruit)
    }
    
    func subtractStock(of fruit: Fruits, amount: Int) throws {
        guard let fruitStock = fruitStocks[fruit], fruitStock >= amount else {
            throw JuiceMakerError.outOfStock
        }
        fruitStocks[fruit] = fruitStock - amount
        
        try checkOutStock(of: fruit)
    }
    
    func checkOutStock(of fruit: Fruits) throws {
        guard let fruitStock = fruitStocks[fruit] else {
            throw JuiceMakerError.fruitError
        }
        print("\(fruit)의 재고는 \(fruitStock)개 입니다.")
    }
}
