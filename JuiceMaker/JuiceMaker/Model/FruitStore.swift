//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private let name: String
    private var fruitStock: Dictionary<Fruit, Int>
    
    init(name: String, fruitStock: Dictionary<Fruit, Int>) {
        self.name = name
        self.fruitStock = fruitStock
    }
    
    func getName() -> String {
        return self.name
    }
    
    func isEnoughStock(fruit: Fruit, amount: Int) throws -> Bool {
        guard let stock = self.fruitStock[fruit] else {
            throw JuiceMakingError.noOption
        }
        if stock < amount {
            return false
        }
        return true
    }
    
    func useFruit(fruit: Fruit, amount: Int) throws {
        guard let stock = self.fruitStock[fruit] else {
            throw JuiceMakingError.noOption
        }
        if stock < amount {
            throw JuiceMakingError.notEnoughStock
        }
    }
}
