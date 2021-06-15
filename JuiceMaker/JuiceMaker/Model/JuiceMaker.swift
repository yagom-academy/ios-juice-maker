//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
enum Juice: String {
    case strawberryJuice = "딸기"
    case bananaJuice = "바나나"
    case kiwiJuice = "키위"
    case pineappleJuice = "파인애플"
    case strawberryBananaJuice = "딸바"
    case mangoJuice = "망고"
    case mangoKiwiJuice = "망키"

    var ingredients: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoJuice:
            return [.mango: 3]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
    var menu: String {
        self.rawValue
    }
}

struct JuiceMaker {
    let fruitStore = FruitStore.shared

    func order(juice: Juice) throws {
        try checkStock(of: juice)
        try blend(juice: juice)
    }

    func checkStock(of juice: Juice) throws {
        for (fruit, amount) in juice.ingredients {
            try fruitStore.hasMoreThan(of: fruit, by: amount)
        }
    }

    func blend(juice: Juice) throws {
        for (fruit, amount) in juice.ingredients {
            try fruitStore.reduceStock(of: fruit, by: amount)
        }
    }
}
