//
//  JuiceMaker - FruitStore.swift
//  Created by dasan & kyungmin.
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    private var fruits: [FruitType: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10]
    
    func checkFruitStock(fruit: FruitType, amount: Int) -> Bool {
        guard let fruitStock = fruits[fruit],
              fruitStock >= amount else {
            return false
        }
        return true
    }
    
    func addFruitCount(at fruit: FruitType, with addCount: Int) {
        guard let fruitStock = fruits[fruit] else {
            return
        }
        fruits[fruit] = fruitStock + addCount
    }
    
    func reduceFruitCount(at fruit: FruitType, with reduceCount: Int) {
        guard let fruitStock = fruits[fruit] else {
            return
        }
        fruits[fruit] = fruitStock - reduceCount
    }
}
