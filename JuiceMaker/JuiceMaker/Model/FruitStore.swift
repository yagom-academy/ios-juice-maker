//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.

import Foundation

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    private var fruitsStock: [Fruit: Int] = [:]
     
    init(defaultCount: Int = 10) {
        Fruit.allCases.forEach { (fruit: Fruit) in
            fruitsStock[fruit] = defaultCount
        }
    }
    
    func makeReady(for juice: Juice) throws -> Bool {
        var isReady = false
        for fruit in juice.recipe.keys {
            isReady = try checkEnoughStock(for: juice, fruit: fruit)
        }
        return isReady
    }
    
    private func checkEnoughStock(for juice: Juice, fruit: Fruit) throws -> Bool {
        guard let currentFruitQuantity = fruitsStock[fruit],
              let needFruitQuantity = juice.recipe[fruit],
              currentFruitQuantity >= needFruitQuantity else {
                  throw JuiceError.notEnoughStock("\(fruit)")
              }
        return true
    }
    
    func changeFruitQuantity(by fruit: Fruit, count: Int) {
        if let currentFruitQuantity = fruitsStock[fruit] {
            fruitsStock.updateValue(currentFruitQuantity - count, forKey: fruit)
        }
    }
}
