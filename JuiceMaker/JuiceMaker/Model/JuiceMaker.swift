//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct Juice {
    enum Menu {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberryBanana
        case mango
        case mangoKiwi
    }
    
    func recipe(menu: Menu) -> [[Fruit: Int]] {
        switch menu {
        case .strawberry:
            return [[Fruit.strawberry: 16]]
        case .banana:
            return [[Fruit.banana: 2]]
        case .kiwi:
            return [[Fruit.kiwi: 3]]
        case .pineapple:
            return [[Fruit.pineapple: 2]]
        case .strawberryBanana:
            return [[Fruit.strawberry: 10], [Fruit.banana: 1]]
        case .mango:
            return [[Fruit.mango: 3]]
        case .mangoKiwi:
            return [[Fruit.mango: 2], [Fruit.kiwi: 1]]
        }
    }
}


// 쥬스 메이커 타입
struct JuiceMaker {
    
}
