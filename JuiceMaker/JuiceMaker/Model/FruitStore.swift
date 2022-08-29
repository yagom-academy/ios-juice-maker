//
//  JuiceMaker - FruitStore.swift
//  Created by stone, jpush.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    static let shared = FruitStore()
    private var fruits: [Fruit : Int] = [:]
    
    private init() {
        Fruit.allCases.forEach { fruit in
            self.fruits[fruit] = 10
        }
    }
    
    func changeCount(fruit: Fruit, by count: Int) {
        guard let fruitCount = fruits[fruit] else {
            return
        }
        
        fruits[fruit] = fruitCount + count
    }
    
    func fetchFruitCount(fruit: Fruit) -> Int? {
        guard let fruitCount = fruits[fruit] else {
            return nil
        }
        
        return fruitCount
    }
}
