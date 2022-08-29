//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
    }
    
    func makeJuice(_ juice: Juice, total: Int) {
//        switch juice {
//        case .strawberryJuice:
//        case .bananaJuice:
//        case .kiwiJuice:
//        case .pineappleJuice
//        case .strawberryBananaJuice
//        case .mangoJuice
//        case .mangoKiwiJuice
//        }
        
//        checkStock(<#T##juice: Juice##Juice#>, total: <#Int#>)
    }
    
    func checkStockOf(fruit: FruitStore.Fruit, count: Int) -> Bool {
        guard let currentStock = fruitStore.fruitStock[fruit] else {
            return false
        }
        
        guard currentStock >= count else {
            return false
        }
        
        return true
    }
}
