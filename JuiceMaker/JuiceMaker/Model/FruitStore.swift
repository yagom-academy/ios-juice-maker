//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

// 과일 타입
class FruitStore {
    //- 각 과일의 초기 재고 : 10개
    //- 각 과일의 수량 n개를 변경하는 기능이 있습니다
    var amount: Int = 10
    var requiredStock = 0
    
    func stockPlus(stock:Int) {
        amount += stock
    }
    
    func stockMinus(stock: Int) {
        amount -= stock
        
    }
    
    func isStockLeft() -> Bool {
        if amount >= requiredStock {
            return true
        } else {
            return false
        }
        
    }
}

class StrawberryStock: FruitStore {
    override init() {
        super.init()
        requiredStock = 16
    }
}

class BananaStock: FruitStore {
    override init() {
        super.init()
        requiredStock = 2
    }
}

class KiwiStock: FruitStore {
    override init() {
        super.init()
        requiredStock = 2
    }
}

class PineappleStock: FruitStore {
    override init() {
        super.init()
        requiredStock = 3
    }
}

class MangoStock: FruitStore {
    override init() {
        super.init()
        requiredStock = 3
    }
    
}


