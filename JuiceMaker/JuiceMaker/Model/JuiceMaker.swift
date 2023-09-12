//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    let fruitStore = FruitStore(fruitStock: [.strawbery: 10, .banana: 10, .pineapple: 10, .kiwi: 10, .mango: 10])
    
    func subtractFruitStock(juice: Juice) {
        for (name, count) in juice.recipe {
            fruitStore.subtractFruitStock(fruitName: name, count: count)
        }
    }
    
    func makeJuice(juice: Juice) {
        switch juice {
        case .strawberyJuice:
            subtractFruitStock(juice: .strawberyJuice)
        case .bananaJuice:
            subtractFruitStock(juice: .bananaJuice)
        case .kiwiJuice:
            subtractFruitStock(juice: .kiwiJuice)
        case .pineappleJuice:
            subtractFruitStock(juice: .pineappleJuice)
        case .strawberyBananaJuice:
            subtractFruitStock(juice: .strawberyBananaJuice)
        case .mangoJuice:
            subtractFruitStock(juice: .mangoJuice)
        case .mangoKiwiJuice:
            subtractFruitStock(juice: .mangoKiwiJuice)
        }
    }
}
