//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

typealias JuiceRecepe = (Fruit, UInt)

class FruitStore {
    var fruitStocks: [Fruit: Int] = [:]
   
    init(initialValue: Int = 10) {
        let fruitList = Fruit.makeFruitList()
        
        for fruit in fruitList {
            self.fruitStocks[fruit] = initialValue
        }
    }
}
