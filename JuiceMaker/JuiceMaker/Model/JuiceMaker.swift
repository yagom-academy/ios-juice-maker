//
//  JuiceMaker - JuiceMaker.swift
//  Created by uemu, Toy.
//  Copyright © yagom academy. All rights reserved.
//

// 쥬스 메이커 타입
struct JuiceMaker {
    private let fruitStore = FruitStore.shared
    
    func manufactureFruitJuice(in fruitJuice: FruitJuice) throws {
        do {
            try fruitStore.reduceFruitQuantity(fruitJuice: fruitJuice)
        } catch let error {
            print("\(error.localizedDescription)")
            throw JuiceMakerError.outOfStock
        }
    }
}
