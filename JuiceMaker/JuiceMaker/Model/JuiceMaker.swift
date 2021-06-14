//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    let store = FruitStore.shared
    
    func makeJuice(_ juice: Juice) {
        do {
            try checkStock(juice.ingredients)
            for (fruit, removingQuantities) in juice.ingredients {
                store.changeStock(fruit, removingQuantities)
            }
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "successAlert"), object: nil, userInfo: ["쥬스이름":juice.description])
        } catch {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "failAlert"), object: nil)
        }
    }
    
    func checkStock(_ ingredients: [(Fruit, Int)]) throws {
        for (fruit, removingQuantities) in ingredients {
            do {
                if store.currentStock(fruit) < removingQuantities {
                    throw JuiceMakerError.outOfStock
                }
            }
        }
    }
}
    
enum JuiceMakerError: Error {
    case outOfStock
    case nilItem // 재고에 없는 과일
}

enum MainError: Error {
    case outOfStock
}

enum Juice: String, CustomStringConvertible {
    case strawberryBananaJuice = "딸바쥬스 주문"
    case mangoKiwiJuice = "망키쥬스 주문"
    case strawberryJuice = "딸기쥬스 주문"
    case bananaJuice = "바나나쥬스 주문"
    case mangoJuice = "망고쥬스 주문"
    case kiwiJuice = "키위쥬스 주문"
    case pineappleJuice = "파인애플쥬스 주문"
    
    var description: String {
        switch self {
        case .strawberryJuice:
            return "딸기"
        case .bananaJuice:
            return "바나나"
        case .pineappleJuice:
            return "파인애플"
        case .kiwiJuice:
            return "키위"
        case .mangoJuice:
            return "망고"
        case .strawberryBananaJuice:
            return "딸바"
        case .mangoKiwiJuice:
            return "망키"
        }
    }
    
    var ingredients: [(Fruit, Int)] {
        switch self {
        case .strawberryJuice:
            return [(.strawberry, 16)]
        case .bananaJuice:
            return [(.banana, 2)]
        case .pineappleJuice:
            return [(.pineapple, 2)]
        case .kiwiJuice:
            return [(.kiwi, 3)]
        case .mangoJuice:
            return [(.mango, 3)]
        case .strawberryBananaJuice:
            return [(.strawberry, 10), (.banana, 1)]
        case .mangoKiwiJuice:
            return [(.mango, 2), (.kiwi, 1)]
        }
    }
}
