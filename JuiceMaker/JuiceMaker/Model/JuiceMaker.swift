//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    let manageFruits = FruitStore()
}

extension JuiceMaker {
    
    func makeJuice(menu: FruitJuice) {
        let result = manageFruits.pickUpFruits(for: menu)
        print(result.rawValue)
    }
}
