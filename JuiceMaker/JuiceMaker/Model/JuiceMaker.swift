//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    func selectMenu(_ juice: Recipe) -> Dictionary<FruitType, Int> {
        checkStockStatus()
        switch juice {
        case strawberryJuice:
            Recipe.makeStrawberryJuice()
        case bananaJuice:
            Recipe.makeBananaJuice()
        case kiwiJuice:
            Recipe.makeKiwiJuice()
        case pineappleJuice:
            Recipe.makePineappleJuice()
        case strawberryBananaJuice:
            Recipe.makeStrawberryBananaJuice()
        case mangoJuice:
            Recipe.makeMangoJuice()
        case mangoKiwiJuice:
            Recipe.makeMangoKiwiJuice()
        }
    }
    
    func checkStockStatus() {
        
    }
}
