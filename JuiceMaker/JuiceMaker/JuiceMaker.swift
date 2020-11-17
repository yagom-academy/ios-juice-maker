
//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by Lina Lim on 11/16/20.
//  Copyright © 2020 llim. All rights reserved.
//

import Foundation

/// 쥬스 메이커 타입
class JuiceMaker {
    private var strawberry: Int = 10
    private var banana: Int = 10
    private var pineapple: Int = 10
    private var kiwi: Int = 10
    private var mango: Int = 10
    
    
    // MARK : 읽기 전용 과일 재고
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
    
    // MARK : alert 구현 전, 확인용 메세지
    func showOutOfStock() {
        print("재료가 모자라요. 재고를 수정할까요?")
    }
    
    func showSuccess() {
        print("쥬스 나왔습니다! 맛있게 드세요!")
    }
    
    // MAKR : juice maker
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
    
    // MAKR : 재고 1개 올리기
    func addStrawberryStock() {
        strawberry = strawberry + 1
    }
    
    func addBananaStock() {
        banana = banana + 1
    }
    
    func addPineappleStock() {
        pineapple = pineapple + 1
    }
    
    func addKiwiStock() {
        kiwi = kiwi + 1
    }
    
    func addMangoyStock() {
        mango = mango + 1
    }
}
