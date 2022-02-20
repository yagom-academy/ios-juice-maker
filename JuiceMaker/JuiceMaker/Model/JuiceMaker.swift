//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker: Makable {
    private(set) var store: FruitStorable
    
    init(store: FruitStorable) {
        self.store = store
    }
    
    /// 주스를 만드는데 필요한 과일들을 사용하여 주스를 만든다
    ///
    /// - Parameters:
    ///     - juice: 만들 주스
    ///
    /// - Throws: 과일의 갯수가 부족하거나 0 인 경우
    ///
    /// - Returns: 주스를 다 만든 경우 true 반환
    mutating func make(into juice: Juice) throws -> Bool {
        for ingredient in juice.ingredients {
            let _ = try store.checkStock(ingredient.name, as: ingredient.count)
        }
        for ingredient in juice.ingredients {
            let _ = try store.use(ingredient.name, to: ingredient.count)
        }
        
        return true
    }
    
    mutating func changeStore(to store: FruitStorable) {
        self.store = store
    }
    
    func checkStock(_ fruit: Fruit, as count: Int) throws -> Bool {
        return try store.checkStock(fruit, as: count)
    }
    
    func checkCount(stock fruit: Fruit) -> Int {
        return store.checkCount(stock: fruit)
    }
}
