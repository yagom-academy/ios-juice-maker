//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias StoreDataType = [Fruit: Int]

protocol FruitStoreType {
    var store: StoreDataType { get }
    func addStock(to fruit: Fruit, count: Int)
    func useStocks(from requests: StoreDataType) throws
}

/// A class that is in charge of managing count of fruits
final class FruitStore: FruitStoreType {
    
    // MARK: - Property
    
    private(set) var store: StoreDataType = [:]
    
    // MARK: - Initialize
    
    init(initialStock: Int = 10) {
        Fruit.allCases.forEach {
            self.store[$0] = initialStock
        }
    }
    
    /// - Parameter count: Can be either positive or negative
    func addStock(to fruit: Fruit, count: Int) {
        if let currentCount = self.store[fruit] {
            self.store[fruit] = currentCount + count
        }
    }
    
    /// Use stocks only if checkStock didn't throw error
    func useStocks(from requests: StoreDataType) throws {
        try checkStock(from: requests)
        
        requests.forEach { fruit, needCount in
            if let currentCount = self.store[fruit] {
                self.store[fruit] = currentCount - needCount
            }
        }
    }
    
    /// Check stock if number of any requested fruits over current stock
    /// - Throws: FruitStoreError
    private func checkStock(from requests: StoreDataType) throws {
        var fruitsOutOfStock: [Fruit] = []
        
        requests.forEach { fruit, needCount in
            if let currentCount = self.store[fruit], currentCount < needCount {
                fruitsOutOfStock.append(fruit)
            }
        }
        
        if !fruitsOutOfStock.isEmpty {
            throw FruitStoreError.outOfStock(fruitsOutOfStock)
        }
    }
}
