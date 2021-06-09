//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    
    var fruitStore = FruitStore()
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case mangoJuice
        case strawberryBananaJuice
        case mangoKiwiJuice
    }
    
    func manager(btnCliked: Juice) {
        var result: Bool = true
        
        switch btnCliked {
        case .strawberryJuice:
            strawberryJuiceMaker()
            
        default:
            return
        }
    }
    
    
    
    func strawberryJuiceMaker() -> Bool {
        if fruitStore.strawberryStock >= 16 {
            fruitStore.inventoryManagement(name: .strawberry, amount: -16)
            return true
        } else {
            print("재고가 부족합니다!")
            return false
        }
        
        
        
    }
    
}
