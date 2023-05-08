//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func createStrawberryJuice() {
        if fruitStore.strawberry >= 16 {
            print("딸기쥬스")
            fruitStore.changeStrawberry(amount: -16)
        }
    }
    
    func createBananaJuice() {
        if fruitStore.banana >= 2 {
            print("바나나쥬스")
            fruitStore.changeBanana(amount: -2)
        }
    }
    
    func createKiwiJuice() {
        if fruitStore.kiwi >= 3 {
            print("키위쥬스")
            fruitStore.changeKiwi(amount: -3)
        }
    }
    
    func createPineappleJuice() {
        if fruitStore.pineapple >= 2 {
            print("파인애플쥬스")
            fruitStore.changePineapple(amount: -2)
        }
    }
    
    func createStrawberryBananaJuice() {
        if fruitStore.strawberry >= 10 && fruitStore.banana >= 1 {
            print("딸바쥬스")
            fruitStore.changeStrawberry(amount: -10)
            fruitStore.changeBanana(amount: -1)
        }
    }
    
    func createMangoJuice() {
        if fruitStore.mango >= 3 {
            print("망고쥬스")
            fruitStore.changeMango(amount: -3)
        }
    }
    
    func createMangoKiwiJuice() {
        if fruitStore.mango >= 2 && fruitStore.kiwi >= 1 {
            print("망고키위쥬스")
            fruitStore.changeMango(amount: -2)
            fruitStore.changeKiwi(amount: -1)
        }
    }
}
