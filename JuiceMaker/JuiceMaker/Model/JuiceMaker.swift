//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func selectMenu(_ juice: Juice) {

        switch juice {
        case .strawberryJuice:
            makeStrawberryJuice()
        case .bananaJuice:
            makeBananaJuice()
        case .kiwiJuice:
            makeKiwiJuice()
        case .pineappleJuice:
            makePineappleJuice()
        case .strawberryBananaJuice:
            makeStrawberryBananaJuice()
        case .mangoJuice:
            makeMangoJuice()
        case .mangoKiwiJuice:
            makeMangoKiwiJuice()
        }
    }
    
    func makeStrawberryJuice() {
        guard var strawberryQuantity = FruitStore.fruitList[.strawberry], strawberryQuantity >= 16 else { return }
        guard strawberryQuantity >= 16 else { return }
        strawberryQuantity -= 16
    }
    
    func makeBananaJuice() {
        
    }
    
    func makeKiwiJuice() {
        
    }
    
    func makePineappleJuice() {
        
    }
    
    func makeStrawberryBananaJuice() {
       
    }
    
    func makeMangoJuice() {
        
    }
    
    func makeMangoKiwiJuice() {
        
    }
}
