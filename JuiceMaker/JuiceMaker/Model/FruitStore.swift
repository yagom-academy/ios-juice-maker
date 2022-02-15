//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

/// A class that is in charge of managing count of fruits
class FruitStore {
    
    // MARK: - Properties
    
    var store: [Fruit: Int] = [:]
    
    // MARK: - Lifecycle
    
    init(initialStock: Int) {
        Fruit.allCases.forEach {
            store[$0] = initialStock
        }
    }
    
    func addStock(fruit: Fruit, count: Int) {
        if let currentCount = store[fruit] {
            store[fruit] = currentCount + count
        }
    }
    
    func useStocks(for recipe: [Fruit: Int]) throws {
        var fruitsOutOfStock: [Fruit] = []
        
        recipe.forEach { fruit, needCount in
            if let currentCount = store[fruit], currentCount < needCount {
                fruitsOutOfStock.append(fruit)
            }
        }
        
        if fruitsOutOfStock.count > 0 {
            throw FruitStoreError.outOfStock(fruitsOutOfStock)
        }
        
        recipe.forEach { fruit, needCount in
            if let currentCount = store[fruit] {
                store[fruit] = currentCount - needCount
            }
        }
    }
}
