//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum Juice {
    case strawberryJuice, bananaJuice, kiwiJuice, pineappleJuice, strawberryBananaJuice, mangoJuice, mangoKiwiJuice
}

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(juice: Juice, fruitStock: [FruitStore.Fruit: Int]) -> Juice {
        switch juice {
        case .strawberryJuice:
            return .strawberryJuice
        case .bananaJuice:
            return .bananaJuice
        case .kiwiJuice:
            return .kiwiJuice
        case .pineappleJuice:
            return .pineappleJuice
        case .strawberryBananaJuice:
            return .strawberryBananaJuice
        case .mangoJuice:
            return .mangoJuice
        case .mangoKiwiJuice:
            return .mangoKiwiJuice
        }
    }
}
