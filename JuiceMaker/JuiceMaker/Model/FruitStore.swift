//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
struct FruitStore {
    var fruitList: [String: Int] = ["strawberry": 10, "banana": 10, "pineapple": 10, "kiwi": 10, "mango": 10]
    
    mutating func changeAmountOfFruits(fruit: String, amount: Int) {
        fruitList[fruit] = amount
    }
}
