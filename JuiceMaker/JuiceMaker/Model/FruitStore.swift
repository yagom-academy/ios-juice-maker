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
    
    let initialStock = 10
    var stock = [Fruit: Int]()

    init() {
        for fruit in Fruit.allCases {
            stock[fruit] = initialStock
        }
    }
}


