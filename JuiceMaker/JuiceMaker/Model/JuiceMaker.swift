//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation


// 쥬스 메이커 타입
enum Juice: CustomStringConvertible {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
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
    var description: String {
        switch self {
        case .strawberryJuice:
            return "딸기"
        case .bananaJuice:
            return "바나나"
        case .kiwiJuice:
            return "키위"
        case .pineappleJuice:
            return "파인애플"
        case .strawberryBananaJuice:
            return "딸바"
        case .mangoJuice:
            return "망고"
        case .mangoKiwiJuice:
            return "망키"
        }
    }
}

struct JuiceMaker {
    let fruitStore = FruitStore()
    
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
            try fruitStore.consumeStock(of: fruit, by: amount)
        }
    }
}
