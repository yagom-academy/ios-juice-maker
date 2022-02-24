//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var fruits: [JuiceTypes: Int] = [:]
    init() {
        let stockCount = 10
        for fruitQuantity in JuiceTypes.allCases {
            fruits[fruitQuantity] = stockCount
        }
    }
    // 함수명: 재고 - 주스에 필요한 과일 수, fruitCount: 주스에 필요한 과일 수
    func consumeFruit(recipe: [JuiceTypes: Int]) throws {
        for (fruit, fruitCount) in recipe {
            guard let stock = fruits[fruit], stock >= fruitCount else {
                throw JuiceMakerError.outOfStock
            }
            fruits[fruit] = stock - fruitCount
        }
    }
}
