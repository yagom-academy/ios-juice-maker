//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import UIKit

enum StoreError: Error {
    
    case outOfStock
    case notEnoughStock(remains: Int)
    
}

struct FruitStore: Storable {
    
    private(set) var stocks: [FruitCounter]
    
    init(stocks: [FruitCounter]) {
        self.stocks = stocks
    }
    
    func use(_ stuff: Fruit, to count: Int) throws -> Int {
        guard let offset = stocks.firstIndex(where: { $0.fruit == stuff }) else {
            return -1
        }
        let _ = try isValidCount(stocks[offset], target: count)
        let remainCount = stocks[offset].count - count
        
        stocks[offset].change(count: remainCount)
        
        return stocks[offset].count
    }
    
    /// 과일 재고를 변경한다
    ///
    /// - Parameters:
    ///     - stuff: 과일의 이름
    ///     - count: 재고를 변경할 과일의 갯수
    ///
    /// - Returns: 변경한 재고의 과일 갯수를 반환
    ///            해당 과일의 이름이 없는 경우 -1 반환
    ///
    func change(_ stuff: Fruit, to count: Int) -> Int {
        guard let offset = stocks.firstIndex(where: { $0.fruit == stuff }) else {
            return -1
        }
        stocks[offset].change(count: count)
        
        return stocks[offset].count
    }
    
    /// 과일의 재고를 확인한다
    ///
    /// - Parameters:
    ///     - stuff: 과일의 이름
    ///     - count: 필요한 과일의 갯수
    ///
    /// - Throws: 재고가 0인 경우 혹은 remain 만큼 남은 경우
    ///
    /// - Returns: 재고가 필요한 과일만큼 가지고 있다면 true
    ///            만약 없다면 오류 반환
    ///
    func isStock(_ stuff: Fruit, as count: Int) throws -> Bool {
        guard let offset = stocks.firstIndex(where: { $0.fruit == stuff }) else {
            return false
        }
        return try isValidCount(stocks[offset], target: count)
    }
    
    private func isValidCount(_ counter: FruitCounter, target: Int) throws -> Bool {
        if counter.isEmpty {
            throw StoreError.outOfStock
            
        } else if counter.count < target {
            throw StoreError.notEnoughStock(remains: counter.count)
        }
        return true
    }
    
}
