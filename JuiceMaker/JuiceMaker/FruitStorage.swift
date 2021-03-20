//
//  FruitStorage.swift
//  JuiceMaker
//
//  Created by James & Tak on 2021/03/12.
//

import Foundation

final class FruitStorage {
    static let shared = FruitStorage()
    private(set) var refrigerator: [Fruit: Int]
    
    private init() {
        refrigerator = [Fruit.strawberry: 10, Fruit.banana:10, Fruit.kiwi: 10, Fruit.mango: 10, Fruit.pineapple: 10]
    }
    
    private func setInitialFruitAmount(input: Int) {
        for (fruit, _) in refrigerator {
            refrigerator.updateValue(input, forKey: fruit)
        }
    }
    
    func manageFruit(fruit: Fruit, quantity: Int) {
        guard let stock = refrigerator[fruit] else {
            return
        }
        refrigerator.updateValue(stock + quantity, forKey: fruit)

    }
    
    func hasEnoughFruit(fruit: Fruit, requiredQuantity: Int) -> Bool {
        guard let stock = refrigerator[fruit],requiredQuantity > 0, stock - requiredQuantity >= 0 else {
            return false
        }
        return true
    }
}
