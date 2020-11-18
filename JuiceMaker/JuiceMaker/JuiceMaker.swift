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
    
    func addMangoStock() {
        mango += 1
    }
    
    func substractMangoStock() {
        mango -= 1
    }
    
    func addKiwiStock() {
        kiwi += 1
    }
    
    func substractKiwiStock() {
        kiwi -= 1
    }
    
    func showFruitStock() {
        print("딸기:\(strawberry) 바나나:\(banana) 파인애플:\(pineapple) 망고:\(mango) 키위:\(kiwi)")
    }
}

class JuiceMaker {
    var stockManager = StockManager()
    
    func makeStrawberryJuice() {
        if stockManager.strawberry >= 3 {
            stockManager.strawberry -= 3
            print("딸기 쥬스 나왔습니다. 맛있게 드세요")
        } else {
            print("딸기가 모자라요. 재고를 수정할까요?")
        }
    }
    
    func makeStrawberryBananaJuice() {
        if stockManager.strawberry >= 10 && stockManager.banana >= 1 {
            stockManager.strawberry -= 10
            stockManager.banana -= 1
            print("딸기바나나 쥬스 나왔습니다. 맛있게 드세요")
        } else if stockManager.strawberry < 10 && stockManager.banana < 1 {
            print("딸기랑 바나나가 모자라요. 재고를 수정할까요?")
        } else if stockManager.banana < 1 {
            print("바나나가 모자라요. 재고를 수정할까요?")
        } else {
            print("딸기가 모자라요. 재고를 수정할까요?")
        }
    }
    
    func makePineappleJuice() {
        if stockManager.pineapple >= 2 {
            stockManager.pineapple -= 2
            print("파인애플 쥬스 나왔습니다. 맛있게 드세요")
        } else {
            print("파인애플이 모자라요. 재고를 수정할까요?")
        }
    }
    
    func makeMangoJuice() {
        if stockManager.mango >= 3 {
            stockManager.mango -= 3
            print("망고 쥬스 나왔습니다. 맛있게 드세요")
        } else {
            print("망고가 모자라요. 재고를 수정할까요?")
        }
    }
    
    func makeMangoKiwiJuice() {
        if stockManager.mango >= 2 && stockManager.kiwi >= 1 {
            stockManager.mango -= 2
            stockManager.kiwi -= 1
            print("망고키위 쥬스 나왔습니다. 맛있게 드세요")
        } else if stockManager.mango < 2 && stockManager.kiwi < 1 {
            print("망고랑 키위가 모자라요. 재고를 수정할까요?")
        } else if stockManager.mango < 2 {
            print("망고가 모자라요. 재고를 수정할까요?")
        } else {
            print("키위가 모자라요. 재고를 수정할까요?")
        }
    }
}
