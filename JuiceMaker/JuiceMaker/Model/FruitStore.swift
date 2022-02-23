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
    
    var fruits: [Fruit: Int] = [:]
     
    init(defaultCount: Int = 10) {
        Fruit.allCases.forEach { (fruit: Fruit) in
            self.fruits[fruit] = defaultCount
        }
    }
    
    func isReadyToMakeJuice(for juice: Juice) -> Bool {
        var hasReady = false
        for fruit in juice.recipe.keys {
            hasReady =  isHaveEnoughStock(for: juice, fruit: fruit)
        }
        return hasReady
    }
    
    func isHaveEnoughStock(for juice: Juice, fruit: Fruit) -> Bool {
        guard let currentFruitStock = self.fruits[fruit],
              let needFruitStock = juice.recipe[fruit],
                  currentFruitStock > needFruitStock else {
            return false
        }
        return true
    }
    
    func checkCurrentFruitStock() {
        self.fruits.forEach { (fruit: Fruit, count: Int) in
            print("과일명: \(fruit), 남은 개수: \(count)")
        }
    }
    
    func changeFruitQuantity(by fruit: Fruit, count: Int) {
        self.fruits.updateValue(count, forKey: fruit)
    }
}
