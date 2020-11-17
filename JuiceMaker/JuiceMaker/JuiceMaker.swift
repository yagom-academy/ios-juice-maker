//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by Lina Lim on 11/16/20.
//  Copyright © 2020 llim. All rights reserved.
//

import Foundation

/// 과일 재고
struct FruitsStock {
    var strawberry: Int = 10
    var banana: Int = 10
    var pineapple: Int = 10
    var kiwi: Int = 10
    var mango: Int = 10
    
    var strawberryStock: Int {
        get {
            return strawberry
        }
    }
    
    var bananaStock: Int {
        get {
            return banana
        }
    }
    
    var pineappleyStock: Int {
        get {
            return pineapple
        }
    }
    
    var kiwiStock: Int {
        get {
            return kiwi
        }
    }
    
    var mangoStock: Int {
        get {
            return mango
        }
    }
}

/// 쥬스 메이커
class JuiceMaker {
    var fruitsStock = FruitsStock()
    
    // MAKR : juice maker
    func makeKiwiJuice() -> Bool {
        if fruitsStock.kiwi >= 3 {
            fruitsStock.kiwi -= 3
            return true
        }
        return false
    }
    
    func makePineappleJuice() -> Bool {
        if fruitsStock.pineapple >= 2 {
            fruitsStock.pineapple -= 2
            return true
        }
        return false
    }
    
    func makeStrawberryBananaJuice() -> Bool {
        if fruitsStock.strawberry >= 10 && fruitsStock.banana >= 1 {
            fruitsStock.strawberry -= 10
            fruitsStock.banana -= 1
            return true
        }
        return false
    }
    
    func makeMangoJuice() -> Bool {
        if fruitsStock.mango >= 3 {
            fruitsStock.mango -= 3
            return true
        }
        return false
    }
    
    func makeMangoKiwiJuice() -> Bool {
        if fruitsStock.mango >= 2 && fruitsStock.kiwi >= 1 {
            fruitsStock.mango -= 2
            fruitsStock.kiwi -= 1
            return true
        }
        return false
    }
    
    // MAKR : 재고 1개 올리기
    func addStrawberryStock() {
        fruitsStock.strawberry += 1
    }
    
    func addBananaStock() {
        fruitsStock.banana += 1
    }
    
    func addPineappleStock() {
        fruitsStock.pineapple += 1
    }
    
    func addKiwiStock() {
        fruitsStock.kiwi += 1
    }
    
    func addMangoStock() {
        fruitsStock.mango += 1
    }
}
