//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    var fruits = Fruits()
    mutating func makeKiwiJuice() -> Bool {
        if fruits.kiwi > 3 {
            fruits.kiwiStock -= 3
            return true
        }
        return false
    }
    
    mutating func makePineappleJuice() -> Bool {
        if fruits.pineapple > 2 {
            fruits.pineappleStock -= 2
            return true
        }
        return false
    }
    
    mutating func makeStrawberryBananaJuice() -> Bool {
        if fruits.strawberry > 10 && fruits.banana > 1 {
            fruits.strawberryStock -= 10
            fruits.bananaStock -= 1
            return true
        }
        return false
    }
    
    mutating func makeMangoJuice() -> Bool {
        if fruits.mango > 3 {
            fruits.mangoStock -= 3
            return true
        }
        return false
    }
    
    mutating func makeMangoKiwiJuice() -> Bool {
        if fruits.mango > 2 && fruits.kiwi > 1 {
            fruits.mangoStock -= 2
            fruits.kiwiStock -= 1
            return true
        }
        return false
    }
}

struct Fruits {
    var strawberryStock: Int = 10
    var bananaStock: Int = 10
    var pineappleStock: Int = 10
    var kiwiStock: Int = 10
    var mangoStock: Int = 10
    
    var strawberry: Int {
        get {
            return strawberryStock
        }
    }
    var banana: Int {
        get {
            return bananaStock
        }
    }
    var pineapple: Int {
        get {
            return pineappleStock
        }
    }
    var kiwi: Int {
        get {
            return kiwiStock
        }
    }
    var mango: Int {
        get {
            return mangoStock
        }
    }
    
    mutating func addFruitStock(strawberry: Int = 0, banana: Int = 0, pineapple: Int = 0, kiwi: Int = 0, mango: Int = 0){
        self.strawberryStock += strawberry
        self.bananaStock += banana
        self.pineappleStock += pineapple
        self.kiwiStock += kiwi
        self.mangoStock += mango
    }
}

