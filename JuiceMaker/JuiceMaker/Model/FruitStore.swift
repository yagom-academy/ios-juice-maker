//
//  JuiceMaker - FruitStore.swift
//  Created by stone, jpush.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    static let shared = FruitStore()
    
    var fruits: [Fruit : Int] = [:]
    
    private init() {
        Fruit.allCases.forEach { fruit in
            self.fruits[fruit] = 10
        }
    }
    
    func useFruits(recipe: [Fruit : Int]) throws {
        for (fruit, amount) in recipe {
            guard let fruitAmount = fruits[fruit] else {
                throw JuiceMakerError.fruitExistError
            }
            
            self.fruits[fruit] = fruitAmount - amount
        }
    }
    
    func fetchFruitAmount(fruit: Fruit) throws -> Int {
        guard let fruitAmount = fruits[fruit] else {
            throw JuiceMakerError.fruitExistError
        }
        
        return fruitAmount
    }
}
