//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

// 과일 저장소 타입
class FruitStore {
    enum Fruit {
        case strawberry
        case banana
        case pineapple
        case mango
    }
    
    var stock: [Fruit: Int] = [.strawberry: 10, .banana: 10, .pineapple: 10, .mango: 10]
    
    
    
}
