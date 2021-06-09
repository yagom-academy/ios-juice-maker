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
    
    func stockPlus(stock:Int) {
        amount += stock
    }
    
    func stockMinus(stock: Int) {
        amount -= stock
    }
    
}

class StrawberryStock: FruitStore {
    
}

class BananaStock: FruitStore {
    
}

class KiwiStock: FruitStore {
    
}

class PineappleStock: FruitStore {
    
}

class MangoStock: FruitStore {
    
}

