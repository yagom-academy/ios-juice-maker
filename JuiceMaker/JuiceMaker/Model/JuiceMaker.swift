//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    let fruitStore = FruitStore(fruits: Fruits(strawberry: 10, banana: 10, kiwi: 10, pineapple: 10, mango: 10))

    // MARK: - 메서드
    func make(_ menu: FruitJuice) -> Result<FruitJuice, FruitError> {
        let result = fruitStore.pickUpFruits(for: menu)
        return result
    }
}
