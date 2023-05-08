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
    
    func changeStrawberry(amount: Int) {
        strawberry += amount
    }
    
    func changeBanana(amount: Int) {
        banana += amount
    }
    
    func changePineapple(amount: Int) {
        pineapple += amount
    }
    
    func changeKiwi(amount: Int) {
        kiwi += amount
    }
    
    func changeMango(amount: Int) {
        mango += amount
    }
}
