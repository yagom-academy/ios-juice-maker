//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    private var stock: [Fruit: Int] = [
        .strawBerry: 10,
        .banana: 10,
        .pineApple: 10,
        .kiwi: 10,
        .mango: 10
    ]
    
    func checkStockAvailability(of juice: Juice) throws {
        for (fruitName, requiredamount) in juice.name {
            guard let stock = self.stock[fruitName], stock != 0 else {
                throw StockError.outOfFruit
            } //
            guard let stock = self.stock[fruitName], stock + requiredamount > 0 else {
                throw StockError.notEnoughFruit
            }
        }
    }
    
    func manageStockOf(_ juice: Juice) {
        for (fruitName, requiredamount) in juice.name {
            if var stock = self.stock[fruitName] {
                stock += requiredamount
            }
        }
    }
}

