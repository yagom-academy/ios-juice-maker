//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore(initialAmount: 10)
    
    func takeOrder(_ fruitJuice: FruitJuice) throws -> Result<FruitJuice, JuiceMakerError> {
        guard try fruitStore.make(fruitJuice) != nil else {
            return .failure(JuiceMakerError.productionImpossibleError)
        }
        return .success(fruitJuice)
    }
    
    func requestCurrentStock() -> [Fruit:Int]? {
        return fruitStore.fruitsStock
    }
}
