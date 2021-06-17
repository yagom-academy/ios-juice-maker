//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum Fruits {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

// 과일 타입
class FruitStore {
    var name: Fruits? = nil
    private var amount: Int = 10
    
    func getAmount() -> Int {
        return amount
    }
    
    func stockPlus(stock:Int) {
        amount = stock
    }
    
    func stockMinus(stock: Int) {
        amount -= stock
    }
    
    func isStockLeft(_ requiredStock: Int) -> Bool {
        return amount >= requiredStock
    }
}

class StrawberryStock: FruitStore {
    override init() {
        super.init()
        name = .strawberry
    }
}

class BananaStock: FruitStore {
    override init() {
        super.init()
        name = .banana
    }
}

class KiwiStock: FruitStore {
    override init() {
        super.init()
        name = .kiwi
    }
}

class PineappleStock: FruitStore {
    override init() {
        super.init()
        name = .pineapple
    }
}

class MangoStock: FruitStore {
    override init() {
        super.init()
        name = .mango
    }
}


