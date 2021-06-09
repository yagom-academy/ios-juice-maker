//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입 
struct JuiceMaker {
    let store = FruitStore()
    
    func makeJuice(_ type: Juice) -> Juice? {
        if checkStock(type.ingredients) {
            for ingredient in type.ingredients as [(fruit: Fruit, removingQuantity:Int)] {
                store.changeStock(ingredient.fruit, ingredient.removingQuantity)
            }
            return type
        } else {
            return nil
        }
    }
    
    func checkStock(_ ingredients: [(fruit: Fruit, removingQuantity:Int)]) -> Bool {
        for ingredient in ingredients {
            if store.currentStock(ingredient.fruit) < ingredient.removingQuantity {
                return false
            }
        }
        return true
    }
}

enum Fruit {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
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
