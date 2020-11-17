//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    private var strawberry: UInt = 0
    private var banana: UInt = 0
    private var pineapple: UInt = 0
    private var kiwi: UInt = 0
    private var mango: UInt = 0
    
    var strawberryCount: UInt {
        get { return strawberry }
    }
    var bananaCount: UInt {
        get { return banana }
    }
    var pineappleCount: UInt {
        get { return pineapple }
    }
    var kiwiCount: UInt {
        get { return kiwi }
    }
    var mangoCount: UInt {
        get { return mango }
    }
    
    init(strawberry: UInt = 10, banana: UInt = 10, pineapple: UInt = 10, kiwi: UInt = 10, mango: UInt = 10) {
        self.strawberry = strawberry
        self.banana = banana
        self.pineapple = pineapple
        self.kiwi = kiwi
        self.mango = mango
    }
    
}
