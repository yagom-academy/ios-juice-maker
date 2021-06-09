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
    
    var ingredients: [Fruits: Int] {
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
    let fruits = [
        Fruits.strawberry: FruitStore(name: Fruits.strawberry),
        Fruits.banana: FruitStore(name: Fruits.banana),
        Fruits.pineapple: FruitStore(name: Fruits.pineapple),
        Fruits.kiwi: FruitStore(name: Fruits.kiwi),
        Fruits.mango: FruitStore(name: Fruits.mango)
    ]
    
    func order(juice: Juice) {
        checkStock(of: juice)
        blend(juice: juice)
    }
    
    func checkStock(of juice: Juice) {
        for (fruitName, count) in juice.ingredients {
            guard let fruit = fruits[fruitName], fruit.hasMoreThan(requiredAmount: count) else {
                print("재고 부족")
                return
            }
        }
    }
    
    func blend(juice: Juice) {
        for (fruitName, count) in juice.ingredients {
            guard let fruit = fruits[fruitName] else {
                return
            }
            fruit.consumeStock(of: count)
        }
        print("\(juice.description) 쥬스 나왔습니다!")
    }
}
