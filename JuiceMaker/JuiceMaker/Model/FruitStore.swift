//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

protocol FruitStoreType {
    var store: [Fruit: Int] { get }
    func addStock(to fruit: Fruit, count: Int)
    func useStocks(from requests: [Fruit: Int]) throws
}

/// A class that is in charge of managing count of fruits
class FruitStore: FruitStoreType {
    
    // MARK: - Properties
    
    private(set) var store: [Fruit: Int] = [:]
    
    // MARK: - Lifecycle
    
    init(initialStock: Int) {
        Fruit.allCases.forEach {
            store[$0] = initialStock
        }
    }
    
    func addStock(to fruit: Fruit, count: Int) {
        if let currentCount = store[fruit] {
            store[fruit] = currentCount + count
        }
    }
    
    func useStocks(from requests: [Fruit: Int]) throws {
        var fruitsOutOfStock: [Fruit] = []
        
        requests.forEach { fruit, needCount in
            if !checkStock(of: fruit, willingAmount: needCount) {
                fruitsOutOfStock.append(fruit)
            }
        }
        
        if fruitsOutOfStock.count > 0 {
            throw FruitStoreError.outOfStock(fruitsOutOfStock)
        }
        
        requests.forEach { fruit, needCount in
            if let currentCount = store[fruit] {
                store[fruit] = currentCount - needCount
            }
        }
    }
    
    
    
    func checkStock(of fruit: Fruit, willingAmount: Int) -> Bool {
        guard let currentCount = store[fruit], currentCount >= willingAmount else {
            return false
        }
        
        return true
    }
}
