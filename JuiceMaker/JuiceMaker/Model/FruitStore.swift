//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var strawberry: Int
    private var banana: Int
    private var pineapple: Int
    private var kiwi: Int
    private var mango: Int
    
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
    
    func checkFruit(name: Fruit, count: Int) -> Bool {
        switch name {
        case .strawberry:
            if strawberry >= count {
                return true
            } else {
                return false
            }
        case .banana:
            if banana >= count {
                return true
            } else {
                return false
            }
        case .pineapple:
            if pineapple >= count {
                return true
            } else {
                return false
            }
        case .kiwi:
            if kiwi >= count {
                return true
            } else {
                return false
            }
        case .mango:
            if mango >= count {
                return true
            } else {
                return false
            }
        }
    }
    
    
}
