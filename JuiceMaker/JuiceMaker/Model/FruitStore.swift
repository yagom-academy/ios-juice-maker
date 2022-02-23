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
    
    func checkStock(fruit: Fruit, amount: Int) throws {
        guard let stock = self.fruitStock[fruit] else {
            throw JuiceMakingError.notRegisteredFruit
        }
        if stock < amount {
            throw JuiceMakingError.notEnoughStock
        }
    }
    
    func useFruit(fruit: Fruit, amount: Int) throws {
        guard let stock = self.fruitStock[fruit] else {
            throw JuiceMakingError.notRegisteredFruit
        }
        if stock < amount {
            throw JuiceMakingError.notEnoughStock
        }
        self.fruitStock[fruit] = stock - amount
    }
    
    func addFruit(fruit: Fruit, amount: Int) throws {
        guard let stock = self.fruitStock[fruit] else {
            throw JuiceMakingError.notRegisteredFruit
        }
        self.fruitStock[fruit] = stock + amount
    }
    
    func addNewFruit(_ fruit: Fruit) throws {
        if let _ = self.fruitStock[fruit] {
            throw JuiceMakingError.duplicatedFruit
        } else {
            self.fruitStock[fruit] = 10
        }
    }
    
    func removeFruit(_ fruit: Fruit) throws {
        if let _ = self.fruitStock[fruit] {
            self.fruitStock.removeValue(forKey: fruit)
        } else {
            throw JuiceMakingError.notRegisteredFruit
        }
    }
}

