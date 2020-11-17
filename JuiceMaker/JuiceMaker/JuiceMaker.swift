//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

/// 쥬스 메이커 타입 
class JuiceMaker {
    var fruitStock = FruitStock()
    
    // 과일 재고
    var strawberryStock: Int {
        return fruitStock.strawberry
    }
    var bananaStock: Int {
        return fruitStock.banana
    }
    var pineappleStock: Int {
        return fruitStock.pineapple
    }
    var kiwiStock: Int {
        return fruitStock.kiwi
    }
    var mangoStock: Int {
        return fruitStock.mango
    }
}

// 과일쥬스 제조
extension JuiceMaker {
    func makeKiwiJuice() {
        fruitStock.kiwi -= 3
    }
    func makePineappleJuice() {
        fruitStock.pineapple -= 2
    }
    func makeStrawberryAndBananaJuice() {
        fruitStock.strawberry -= 10
        fruitStock.banana -= 1
    }
    func makeMangoJuice() {
        fruitStock.mango -= 3
    }
    func makeMangoAndKiwiJuice() {
        fruitStock.mango -= 2
        fruitStock.kiwi -= 1
    }
}


//enum FruitStock {
//    case strawberry
//    case banana
//    case pineapple
//    case kiwi
//    case mango
//}
//
//enum MakeJuice {
//    case kiwiJuice
//    case strawberryJuice
//    case mangoJuice
//    case strawberryAndBananaJuice
//    case mangoAndKiwiJuice
//}

struct FruitStock {
    // 과일 재고
    var strawberry = 10
    var banana = 10
    var pineapple = 10
    var kiwi = 10
    var mango = 10
    
    // 과일 재고 추가/제거
    func addOneFruit(_ fruit: inout Int) {
        fruit += 1
    }
    func minusOneFruit(_ fruit: inout Int){
        fruit -= 1
    }
}
