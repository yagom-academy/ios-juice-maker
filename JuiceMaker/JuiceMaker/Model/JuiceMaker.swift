//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    let store = FruitStore()
    
    func makeJuice(_ juice: Juice) throws {
        do {
            try checkStock(juice.ingredients)
            for (fruit, removingQuantities) in juice.ingredients {
                try store.changeStock(fruit, removingQuantities)
            }
            
        } catch JuiceMakerError.outOfStock {
            throw MainError.outOfStock
        } catch JuiceMakerError.nilItem {
            // 재고에 없는 과일 관련처리
        }
    }
    
    func checkStock(_ ingredients: [(Fruit, Int)]) throws {
        for (fruit, removingQuantities) in ingredients {
            do {
                if try store.currentStock(fruit) < removingQuantities {
                    throw JuiceMakerError.outOfStock
                }
            } catch JuiceMakerError.outOfStock{
                throw MainError.outOfStock
            } catch JuiceMakerError.nilItem {
                // 재고에 없는 과일 관련처리
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

enum Juice: Int, CustomStringConvertible {
    case strawberryBananaJuice = 1
    case mangoKiwiJuice
    case strawberryJuice
    case bananaJuice
    case mangoJuice
    case kiwiJuice
    case pineappleJuice
    
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
