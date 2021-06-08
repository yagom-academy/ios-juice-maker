//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func makeJuice(of menu: JuiceMenu) -> Bool {
        guard checkStocks(of: menu) else { return false }
        for (fruit, amout) in menu.neededFruits {
            fruitStore.minusStock(of: fruit, amout: amout)
        }
        return true
    }
    
    func checkStocks(of menu: JuiceMenu) -> Bool {
        var isAvailable = true
        for (fruit, amout) in menu.neededFruits {
            isAvailable = isAvailable && fruitStore.getStock(of: fruit) >= amout
        }
        return isAvailable
    }
}
