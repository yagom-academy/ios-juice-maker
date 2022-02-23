//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    private var fruits: [Fruit: Int] = [:]
     
    init(defaultCount: Int = 10) {
        Fruit.allCases.forEach { (fruit: Fruit) in
            self.fruits[fruit] = defaultCount
        }
    }
    
    func isReadyToMakeJuice(for juice: Juice) -> Bool {
        var isReady = false
        for fruit in juice.recipe.keys {
            isReady = isHaveEnoughStock(for: juice, fruit: fruit)
        }
        return isReady
    }
    
    private func isHaveEnoughStock(for juice: Juice, fruit: Fruit) -> Bool {
        guard let currentFruitQuantity = self.fruits[fruit],
              let needFruitQuantity = juice.recipe[fruit],
              currentFruitQuantity >= needFruitQuantity else {
                  return false
              }
        return true
    }
    
    func changeFruitQuantity(by fruit: Fruit, count: Int) {
        if var currentFruitQuantity = self.fruits[fruit] {
            currentFruitQuantity += count
            self.fruits.updateValue(currentFruitQuantity, forKey: fruit)
        }
    }
}
