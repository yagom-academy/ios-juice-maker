
//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by Lina Lim on 11/16/20.
//  Copyright © 2020 llim. All rights reserved.
//

import Foundation

/// 쥬스 메이커 타입
class JucieMaker {
    // 읽기전용으로 재고 확인하기
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
    
    func showOutOfStock() {
        print("재료가 모자라요. 재고를 수정할까요?")
    }
    
    func showSuccess() {
        print("쥬스 나왔습니다! 맛있게 드세요!")
    }
    
    func makeKiwiJuice() {
        if kiwi >= 3 {
            kiwi = kiwi - 3
            return showSuccess()
        }
        showOutOfStock()
    }
    
    func makePineappleJuice() {
        if pineapple >= 2 {
            pineapple = pineapple - 2
            return showSuccess()
        }
        showOutOfStock()
    }
    
    func makeStrawberryBananaJuice() {
        if strawberry >= 10 && banana >= 1 {
            strawberry = strawberry - 10
            banana = banana - 1
            return showSuccess()
        }
        showOutOfStock()
    }
    
    func makeMangoJuice() {
        if mango >= 3 {
            mango = mango - 3
            return showSuccess()
        }
        showOutOfStock()
    }
    
    func makeMangoKiwiJuice() {
        if mango >= 2 && kiwi >= 1 {
            mango = mango - 2
            kiwi = kiwi - 1
            return showSuccess()
        }
        showOutOfStock()
    }
    
    func AddStrawberryStock() {
        strawberry = strawberry + 1
    }
    
    func AddBananaStock() {
        banana = banana + 1
    }
    
    func AddPineappleStock() {
        pineapple = pineapple + 1
    }
    
    func AddKiwiStock() {
        kiwi = kiwi + 1
    }
    
    func AddMangoyStock() {
        mango = mango + 1
    }
}
