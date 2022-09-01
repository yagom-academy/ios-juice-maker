//
//  JuiceMaker - FruitStore.swift
//  Created by stone, jpush.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    typealias Amount = Int
    
    static let shared = FruitStore()
    var fruits: [Fruit : Amount] = [:]
    
    private init() {
        Fruit.allCases.forEach { fruit in
            self.fruits[fruit] = 10
        }
    }
    
    func useFruits(for recipe: [Fruit : Amount]) throws {
        for (fruit, amount) in recipe {
            let fruitAmount = try fetchFruitAmount(for: fruit)
            self.fruits[fruit] = fruitAmount - amount
        }
    }
    
    func fetchFruitAmount(for fruit: Fruit) throws -> Int {
        guard let fruitAmount = fruits[fruit] else {
            throw JuiceMakerError.fruitExistError
        }
        
        return fruitAmount
    }
}
