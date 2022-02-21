//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
class JuiceMaker: FruitStore {
    
    struct Juice {
        let juiceName: String
        let recipe: [Fruit: Int]
        
        init(name: String, recipe: [Fruit: Int]) {
            self.juiceName = name
            self.recipe = recipe
        }
    }
    
}
