//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

struct FruitStore: FruitStorable {
    private var manager: FruitStockManager
    
    init(manager: FruitStockManager) {
        self.manager = manager
    }
    
    /// 과일 재고를 사용한다
    ///
    /// - Parameters:
    ///     - fruit: 과일의 이름
    ///     - count: 사용할 과일의 갯수
    ///
    /// - Throws: 해당 과일의 갯수가 부족하거나 0인 경우
    mutating func use(_ fruit: Fruit, to count: Int) throws {
        let _ = try checkStock(fruit, as: count)
        let stock = checkCount(stock: fruit)
        let remainCount = stock - count
        
        manager.change(amount: remainCount, about: fruit)
    }
    
    /// 과일의 재고를 변경한다
    ///
    /// - Parameters:
    ///     - fruit: 과일의 이름
    ///     - count: 재고를 변경할 과일의 갯수
    mutating func change(_ fruit: Fruit, to count: Int) {
        manager.change(amount: count, about: fruit)
    }
    
    /// 과일의 재고를 확인한다
    ///
    /// - Parameters:
    ///     - fruit: 과일 열거형 타입
    ///     - count: 필요한 과일의 갯수
    ///
    /// - Throws: 재고가 0인 경우 혹은 remain 만큼 남은 경우
    ///
    /// - Returns: 재고가 필요한 과일만큼 가지고 있다면 true
    func checkStock(_ fruit: Fruit, as count: Int) throws -> Bool {
        let stock = checkCount(stock: fruit)
        
        if stock == Int.zero {
            throw StoreError.outOfStock(name: fruit.name)
            
        } else if stock < count {
            throw StoreError.notEnoughStock(name: fruit.name, stock: stock)
        }
        return true
    }
    
    /// 과일의 재고 갯수를 확인한다
    ///
    /// - Parameters:
    ///     - fruit: 과일 열거형 타입
    ///
    /// - Returns: 재고 갯수
    func checkCount(stock fruit: Fruit) -> Int {
        return manager.count(stock: fruit)
    }
}
