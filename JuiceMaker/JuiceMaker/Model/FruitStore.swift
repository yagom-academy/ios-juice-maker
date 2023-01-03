//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var strawberry: Int
    var banana: Int
    var pineapple: Int
    var kiwi: Int
    var mango: Int
    
    init(number: Int) {
        strawberry = 10
        banana = 10
        pineapple = 10
        kiwi = 10
        mango = 10
    }
    
    func addFruit(of fruit: Fruit) {
        switch fruit {
        case .strawberry:
            strawberry += 1
        case .banana:
            banana += 1
        case .pineapple:
            pineapple += 1
        case .kiwi:
            kiwi += 1
        case .mango:
            mango += 1
        }
    }
    
    func reduceFruit(of fruit: Fruit) {
        switch fruit {
        case .strawberry:
            strawberry -= 1
        case .banana:
            banana -= 1
        case .pineapple:
            pineapple -= 1
        case .kiwi:
            kiwi -= 1
        case .mango:
            mango -= 1
        }
    }
}
