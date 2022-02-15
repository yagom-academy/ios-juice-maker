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

// 과일 저장소 타입
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
        
    }
    
    func useStocks(from requests: [Fruit : Int]) throws {
        
    }

}
