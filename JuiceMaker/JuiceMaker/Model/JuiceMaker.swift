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
        for (fruit, amount) in menu.neededFruits {
            fruitStore.subtractStock(of: fruit, amount: amount)
        }
        return true
    }
    
    private func checkStocks(of menu: JuiceMenu) -> Bool {
        var isAvailable = true
        for (fruit, amount) in menu.neededFruits {
            isAvailable = isAvailable && fruitStore.getStock(of: fruit) >= amount
        }
        return isAvailable
    }
}
