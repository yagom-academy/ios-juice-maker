//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}


// 과일 저장소 타입
class FruitStore {
    private var strawberry: Int = 10
    private var banana: Int = 10
    private var pineapple: Int = 10
    private var kiwi: Int = 10
    private var mango: Int = 10
    
    func changeFruitCount(_ fruit: Fruit, count: Int) {
        switch fruit {
        case .strawberry:
            strawberry -= count
        case .banana:
            banana -= count
        case .pineapple:
            pineapple -= count
        case .kiwi:
            kiwi -= count
        case .mango:
            mango -= count
        }
    }
}
