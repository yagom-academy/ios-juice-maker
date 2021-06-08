//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    enum JuiceMenu {
        case strawberry(Fruit, Int)
        case banana(Fruit, Int)
        case pineapple(Fruit, Int)
        case kiwi(Fruit, Int)
        case mango(Fruit, Int)
        case strawberryBanana(Fruit, Int, Fruit, Int)
        case mangoKiwi(Fruit, Int, Fruit, Int)
    }
}
