//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var stock: [Fruit: Int] = [:]
    
    init() {
        self.initFruitStore()
    }
    
    func initFruitStore(initCount: Int = 10) {
        Fruit.allCases.forEach { fruit in
            stock[fruit] = initCount
        }
    }
    
    private func reduceFruit(fruit: Fruit, count: Int) {
        guard let currentFruitCount = stock[fruit], currentFruitCount >= count else {
            fatalError()
        }
        stock[fruit] = currentFruitCount - count
    }
    
    func useFruit(juice: Juice) {
        juice.recipe.fruitList.forEach { fruitInfo in
            reduceFruit(fruit: fruitInfo.fruit, count: fruitInfo.count)
        }
    }
    
    func canMakeJuice(juice: Juice) -> Bool {
        for fruitInfo in juice.recipe.fruitList {
            guard let currentFruitCount = stock[fruitInfo.fruit] else {
                return false
            }
            
            if currentFruitCount < fruitInfo.count {
                return false
            }
        }
        return true
    }
}
