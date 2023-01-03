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
        strawberry = number
        banana = number
        pineapple = number
        kiwi = number
        mango = number
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
            return strawberry >= count ? true : false
        case .banana:
            return banana >= count ? true : false
        case .pineapple:
            return pineapple >= count ? true : false
        case .kiwi:
            return kiwi >= count ? true : false
        case .mango:
            return mango >= count ? true : false
        }
    }
    
    func reduceFruitOfJuice(of fruitJuice: FruitJuice) {
        switch fruitJuice {
        case .strawberryJuice:
            strawberry -= 16
        case .bananaJuice:
            banana -= 2
        case .pineappleJuice:
            pineapple -= 2
        case .kiwiJuice:
            kiwi -= 3
        case .mangoJuice:
            mango -= 3
        case .strawberryBananaJuice:
            strawberry -= 10
            banana -= 1
        case .mangoKiwiJuice:
            mango -= 2
            kiwi -= 1
        }
    }
}
