//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    private(set) var fruitStock: [Fruit : Int] = [:]

    init() {
        Fruit.allCases.forEach {
            fruitStock[$0] = 10
        }
    }
    
    init(stock: Int) {
        Fruit.allCases.forEach {
            fruitStock[$0] = stock
        }
    }
    
    func changeStock(_ fruitStock: [Fruit : Int]) {
        self.fruitStock = fruitStock
    }
    
    func useStock(of fruit: Fruit, amount: Int) throws {
        let stock = try receiveStock(of: fruit)
        
        guard stock - amount >= 0 else {
            throw JuiceError.shortageFruitStock
        }
        
        fruitStock.updateValue(stock - amount, forKey: fruit)
    }
    
    func receiveStock(of fruit: Fruit) throws -> Int {
        guard let stock = fruitStock[fruit] else {
            throw JuiceError.nonexistentFruit
        }
        
        return stock
    }
}
