//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var stocks: [Fruit: Int]
    
    init(initalValue: Int = 10) {
        var stocks: [Fruit: Int] = [:]
        for fruit in Fruit.allCases {
            stocks[fruit] = initalValue
        }
        self.stocks = stocks
    }
}
