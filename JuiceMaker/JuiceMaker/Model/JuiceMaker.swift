//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker  {
    var store = FruitStore()
    
    func makeJuice(_ juice: Juice) throws {
        do {
            try FruitStore.checkStockAvailability(of: juice)
        } catch StockError.notEnoughFruit {
            print("재고 부족")
        } catch StockError.outOfFruit {
            print("재고 없음")
        }
        FruitStore.manageStockOf(juice)
    }
}
