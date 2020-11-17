//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 
class JuiceMaker {
    // 과일 재고
    var strawberryStock: Int {
        return strawberry
    }
    var bananaStock: Int {
        return banana
    }
    var pineappleStock: Int {
        return pineapple
    }
    var kiwiStock: Int {
        return kiwi
    }
    var mangoStock: Int {
        return mango
    }
    
    var strawberry = 10
    var banana = 10
    var pineapple = 10
    var kiwi = 10
    var mango = 10
    
    // 과일쥬스 제조
    func makeKiwiJuice() {
        kiwi -= 3
    }
    func makePineappleJuice() {
        pineapple -= 2
    }
    func makeStrawberryAndBananaJuice() {
        strawberry -= 10
        banana -= 1
    }
    func makeMangoJuice() {
        mango -= 3
    }
    func makeMangoAndKiwiJuice() {
        mango -= 2
        kiwi -= 1
    }
}
