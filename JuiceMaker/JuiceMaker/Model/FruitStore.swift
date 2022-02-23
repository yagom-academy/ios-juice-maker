//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruits: [FruitsTypes: Int] = [:]
    init() {
        let initialStock = 10
        for fruitQuantity in FruitsTypes.allCases {
            fruits[fruitQuantity] = initialStock
        }
    }
    
    func countFruit(recipe: [FruitsTypes: Int]) throws {
        for (fruit, fruitCount) in recipe {
            guard let stock = fruits[fruit], stock >= fruitCount else {
                throw JuiceMakerError.outOfStock
            }
            fruits[fruit] = stock - fruitCount
        }
    }
}
