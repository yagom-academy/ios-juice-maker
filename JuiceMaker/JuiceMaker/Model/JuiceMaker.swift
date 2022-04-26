//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let manageFruits = FruitStore()
    
    enum FruitJuice: String {
        case strawberry
        case banana
        case kiwi
        case pineapple
        case strawberryAndBanana
        case mango
        case mangoAndKiwi
    }
}

extension JuiceMaker {
    func makeJuice(menu: FruitJuice) {
        switch menu {
        case .strawberry:
            manageFruits.useFruits(strawberry: 16)
        case .banana:
            manageFruits.useFruits(banana: 2)
        case .kiwi:
            manageFruits.useFruits(kiwi: 3)
        case .pineapple:
            manageFruits.useFruits(pineapple: 2)
        case .strawberryAndBanana:
            manageFruits.useFruits(strawberry: 10, banana: 1)
        case .mango:
            manageFruits.useFruits(mango: 3)
        case .mangoAndKiwi:
            manageFruits.useFruits(kiwi: 1, mango: 2)
        }
    }
}
