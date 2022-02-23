//
//  JuiceMaker - JuiceMaker.swift
//  Created by Doogie & Malrang. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let store = FruitStore(defaultValue: 10)
    
    func makeJuice(juice: Juice) {
        do {
            try store.checkStock(juice: juice)
        } catch MakingError.outOfStock {
            print("재고 없음!")
        } catch {}
    }
}
