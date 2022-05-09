//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

typealias FruitStock = [Fruit: Int]

protocol StorageManaging {
    func count(_ fruit: Fruit) -> Int
    func add(fruit: Fruit, as amount: Int)
    func consume(_ stock: FruitStock) throws
    func listUp() -> FruitStock
}

//MARK: 과일 저장소 타입
final class FruitStore: StorageManaging {
    private var fruits: FruitStock = [:]
    
    init(initialValue: Int = 10) {
        Fruit.allCases.forEach { fruit in
            self.fruits.updateValue(initialValue, forKey: fruit)
        }
    }
}

extension FruitStore {
    func count(_ fruit: Fruit) -> Int {
        guard let currentQuantity = self.fruits[fruit] else {
            return 0
        }
        return currentQuantity
    }
    
    func add(fruit: Fruit, as amount: Int) {
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
    
    func listUp() -> FruitStock {
        return fruits
    }
}
