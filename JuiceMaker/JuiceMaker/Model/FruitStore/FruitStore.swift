//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias FruitStock = [FruitType: Int]

protocol StorageManaging {
    func count(_ fruit: FruitType) -> Int
    func editStock(of fruit: FruitType, with amount: Int)
    func consume(_ stock: FruitStock) throws
    func stockUp() -> FruitStock
}

//MARK: 과일 저장소 타입
final class FruitStore: StorageManaging {
    private var fruits: FruitStock = [:]
    
    init(initialValue: Int = 10) {
        FruitType.allCases.forEach { fruit in
            self.fruits.updateValue(initialValue, forKey: fruit)
        }
    }
}

extension FruitStore {
    func count(_ fruit: FruitType) -> Int {
        guard let currentQuantity = self.fruits[fruit] else {
            return 0
        }
        return currentQuantity
    }
    
    func editStock(of fruit: FruitType, with amount: Int) {
        self.fruits.updateValue(amount, forKey: fruit)
    }
    
    func consume(_ stock: FruitStock) throws {
        try stock.forEach { (fruit, amount) in
            if count(fruit) < amount {
                throw StockError.notEnoughIngredient
            }
            self.fruits.updateValue(count(fruit) - amount, forKey: fruit)
        }
    }
    
    func stockUp() -> FruitStock {
        return fruits
    }
}
