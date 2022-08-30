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
    
    func changeCount(fruit: Fruit, by count: Int) throws {
        guard let fruitCount = fruits[fruit] else {
            throw JuiceMakerError.fruitExistError
        }
        
        fruits[fruit] = fruitCount + count
    }
    
    func induceFruit(recipe: [Fruit : Int]) throws {
        for (fruit, amount) in recipe {
            guard let fruitAmount = fruits[fruit] else {
                throw JuiceMakerError.fruitExistError
            }
        
            fruits[fruit] = fruitAmount - amount
        }
    }
    
    func fetchFruitCount(fruit: Fruit) throws -> Int {
        guard let fruitCount = fruits[fruit] else {
            throw JuiceMakerError.fruitExistError
        }
        
        return fruitCount
    }
}
