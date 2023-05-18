//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var fruitsStock: [Fruit: Int] = Dictionary(uniqueKeysWithValues: Fruit.allCases.map{ ($0, 10) })
    
    func bringStock(_ fruit: Fruit) -> Int {
        guard let stock = fruitsStock[fruit] else { return 0 }
        
        return stock
    }
    
    private func compare(_ stock: Int, and amount: Int) throws {
        guard stock >= amount else { throw JuiceMakerError.outOfStock }
    }
    
    func addFruits(_ amount: Int, to fruit: Fruit) {
        var stock = bringStock(fruit)
        stock += amount
            
        fruitsStock[fruit] = stock
    }
    
    func useFruits(_ amount: Int, to fruit: Fruit) throws {
        var stock = bringStock(fruit)
        try compare(stock, and: amount)
        stock -= amount
        
        fruitsStock[fruit] = stock
    }
}

