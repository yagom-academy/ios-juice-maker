//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

let fruitStore = FruitStore()

// 쥬스 메이커 타입
struct JuiceMaker {
    func strawBerryJuice() {
        if fruitStore.strawBerry <= 16 {
            fruitStore.strawBerry -= 16
        } else {
            print("재고가 없습니다.")
        }
    }
}

