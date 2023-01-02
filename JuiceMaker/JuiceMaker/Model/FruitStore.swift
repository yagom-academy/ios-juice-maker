//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var strawberry: Int = 10
    var banana: Int = 10
    var pineapple: Int = 10
    var kiwi: Int = 10
    var mango: Int = 10
    
    static let shared = FruitStore()
    private init() {}
    
    func buyStrawberry(howMany: Int) {
        strawberry += howMany
    }
    
    func buyBanana(howMany: Int) {
        banana += howMany
    }
    
    func buyPineapple(howMany: Int) {
        pineapple += howMany
    }
    
    func buyKiwi(howMany: Int) {
        kiwi += howMany
    }
    
    func buyMango(howMany: Int) {
        mango += howMany
    }
}
