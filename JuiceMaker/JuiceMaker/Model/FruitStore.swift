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
final class FruitStore: FruitStoreType {
    
    // MARK: - Property
    
    private(set) var store: [Fruit: Int] = [:]
    
    // MARK: - Initialize
    
    init(initialStock: Int = 10) {
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
        try checkStock(from: requests)
        
        requests.forEach { fruit, needCount in
            if let currentCount = store[fruit] {
                store[fruit] = currentCount - needCount
            }
        }
    }
    
    private func checkStock(from requests: [Fruit: Int]) throws {
        var fruitsOutOfStock: [Fruit] = []
        
        requests.forEach { fruit, needCount in
            if let currentCount = store[fruit], currentCount < needCount {
                fruitsOutOfStock.append(fruit)
            }
        }
        
        if !fruitsOutOfStock.isEmpty {
            throw FruitStoreError.outOfStock(fruitsOutOfStock)
        }
    }
}
