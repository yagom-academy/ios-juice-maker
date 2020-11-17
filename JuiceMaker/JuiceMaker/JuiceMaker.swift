//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

class StockManager {
    
    var strawberry:Int = 10
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
    
    var pineappleStock: Int {
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
    func addStrawberryStock() {
        strawberry += 1
    }
    
    func substractStrawberryStock() {
        strawberry -= 1
    }
    
    func addBananaStock() {
        banana += 1
    }
    
    func substractBananaStock() {
        banana -= 1
    }
    
    func addPineappleStock() {
        pineapple += 1
    }
    
    func substractPineappleStock() {
        pineapple -= 1
    }
    
    func plusMangoStock() {
        mango += 1
    }
    
    func substractMangoStock() {
        mango -= 1
    }
    
    func addKiwiStock() {
        kiwi += 1
    }
    
    func substractkiwiStock() {
        kiwi -= 1
    }
    
    func showFruitStock() {
        print("딸기:\(strawberry) 바나나:\(banana) 파인애플:\(pineapple) 망고:\(mango) 키위:\(kiwi)")
    }
}
