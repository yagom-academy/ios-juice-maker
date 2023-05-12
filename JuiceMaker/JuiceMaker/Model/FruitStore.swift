//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitsStock: [Fruit: Int] = Dictionary(uniqueKeysWithValues: Fruit.allCases.map{ ($0, 10) })
    
    func getStock(_ fruit: Fruit) throws -> Int {
        guard let stock = fruitsStock[fruit] else { throw JuiceMakerError.nonExistentFruit }
        
        return stock
    }
    
    private func compare(_ stock: Int, and amount: Int) throws {
        guard stock >= amount else { throw JuiceMakerError.outOfStock }
    }
    
    func addFruits(_ amount: Int, to fruit: Fruit) throws {
        var stock = try getStock(fruit)
        stock += amount
            
        fruitsStock[fruit] = stock
    }
    
    func useFruits(_ amount: Int, to fruit: Fruit) throws {
        var stock = try getStock(fruit)
        try compare(stock, and: amount)
        stock -= amount
        
        fruitsStock[fruit] = stock
    }
}

