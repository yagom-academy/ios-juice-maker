//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    
}

struct Juice {
    var name: String
    var ingredients: [Fruit : Int] = [:]
    
    init(name: String, ingredientList: [(Fruit, Int)]) {
        self.name = name
        for (fruit, amount) in ingredientList {
            ingredients[fruit] = amount
        }
    }
}
