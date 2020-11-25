//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum JuiceName: String {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
}

enum FruitName: String {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

class Stock {
    private(set) var starwberry: UInt
    private(set) var banana: UInt
    private(set) var kiwi: UInt
    private(set) var mango: UInt
    private(set) var pineapple: UInt
    let initialStock: UInt = 10
    
    init() {
        self.starwberry = initialStock
        self.banana = initialStock
        self.kiwi = initialStock
        self.mango = initialStock
        self.pineapple = initialStock
    }
}
