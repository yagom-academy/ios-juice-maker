//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    var store = FruitStore()
    
    func makeJuice(_ juice: Juice) throws {
        for (ingredient, count) in juice.name {
            do {
                try checkCondition(ingredient, count)
            } catch StockError.fruits {
                print("error")
            }
        }
        
        for (ingredient, count) in juice.name {
            store.changeInventory(ingredient, count)
        }
    }

    func checkCondition(_ ingredient: Fruit, _ count: Int) throws {
        switch ingredient {
        case .strawBerry:
            if store.strawBerry + count < 0 {
                throw StockError.fruits
            }
        case .banana:
            if store.banana + count < 0 {
                throw StockError.fruits
            }
        case .pineApple:
            if store.pineApple + count < 0 {
                throw StockError.fruits
            }
        case .kiwi:
            if store.kiwi + count < 0 {
                throw StockError.fruits
            }
        case .mango:
            if store.mango + count < 0 {
                throw StockError.fruits
            }
        }
    }
}
