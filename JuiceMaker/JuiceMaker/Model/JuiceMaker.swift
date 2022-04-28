//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore(initialAmount: 10)
    
    func takeOrder(_ fruitJuice: FruitJuice) {
        do {
            try fruitStore.make(fruitJuice)
        } catch JuiceMakerError.outOfStock {
            print("재고가 부족합니다.")
        } catch {
            print(error)
        }
    }
}
