//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    enum Fruit: CaseIterable {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case mango
    }
    var fruitStockList: [Fruit: Int] = [:]
    
    init(initialFruitStock: Int = 10) {
        for fruit in Fruit.allCases {
            fruitStockList[fruit] = initialFruitStock
        }
    }
}
