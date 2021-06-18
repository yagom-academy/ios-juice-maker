//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    var fruitStore = FruitStore()
    
    func makeJuice(of menu: JuiceMenu) throws {
        guard checkStocks(of: menu) else { throw ErrorCase.outOfStock  }
        for (fruit, amount) in menu.neededFruits {
            fruitStore.subtractStock(of: fruit, amount: amount)
        }
    }
    
    private func checkStocks(of menu: JuiceMenu) -> Bool {
        var isAvailable = true
        for (fruit, amount) in menu.neededFruits {
            isAvailable = isAvailable && fruitStore.getStock(of: fruit) >= amount
        }
        return isAvailable
    }
}
