//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    private(set) var fruits: [Fruit : Int] = [:]

    init() {
        Fruit.allCases.forEach {
            fruits[$0] = 10
        }
    }
    
    init(stock: Int) {
        Fruit.allCases.forEach {
            fruits[$0] = stock
        }
    }
    
    func addStock(of fruit: Fruit, amount: Int) throws {
        let stock = try receiveStock(of: fruit)
        
        fruits.updateValue(stock + amount, forKey: fruit)
    }
    
    func useStock(of fruit: Fruit, amount: Int) throws {
        let stock = try receiveStock(of: fruit)
        
        guard stock - amount >= 0 else {
            throw JuiceError.shortageFruitStock
        }
        
        fruits.updateValue(stock - amount, forKey: fruit)
    }
    
    func receiveStock(of fruit: Fruit) throws -> Int {
        guard let stock = fruits[fruit] else {
            throw JuiceError.nonexistentFruit
        }
        
        return stock
    }
}
