//
//  JuiceMaker - FruitStore.swift
//  Created by stone, jpush.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    
    static let shared = FruitStore()
    var fruitsStock: [Fruit : Int] = [:]
    
    private init() {
        Fruit.allCases.forEach { fruit in
            self.fruitsStock[fruit] = 10
        }
    }
    
    func useFruits(for recipe: [Fruit : Int]) throws {
        for (fruit, amount) in recipe {
            let fruitAmount = try fetchFruitAmount(for: fruit)
            self.fruitsStock[fruit] = fruitAmount - amount
        }
    }
    
    func fetchFruitAmount(for fruit: Fruit) throws -> Int {
        guard let fruitAmount = fruitsStock[fruit] else {
            throw JuiceMakerError.fruitExistError
        }
        
        return fruitAmount
    }
}
