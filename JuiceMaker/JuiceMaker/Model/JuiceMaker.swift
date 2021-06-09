//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
enum Juice {
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
}

struct JuiceMaker {
//    var strawberry = FruitStore(name: Fruits.strawberry)
//    var banana = FruitStore(name: Fruits.banana)
//    var pineapple = FruitStore(name: Fruits.pineapple)
//    var kiwi = FruitStore(name: Fruits.kiwi)
//    var mango = FruitStore(name: Fruits.mango)
    let fruits = [
        Fruits.strawberry: FruitStore(name: Fruits.strawberry),
        Fruits.banana: FruitStore(name: Fruits.banana),
        Fruits.pineapple: FruitStore(name: Fruits.pineapple),
        Fruits.kiwi: FruitStore(name: Fruits.kiwi),
        Fruits.mango: FruitStore(name: Fruits.mango)
    ]
    
    func order(juice: Juice) {
        checkStock(of: juice)
        makeJuice()
    }
    
    func checkStock(of juice: Juice) {
        for (fruitName, count) in juice.ingredients {
            guard let fruit = fruits[fruitName], fruit.hasMoreThan(requiredAmount: count) else {
                print("재고 부족")
                return
            }
        }
    }
    
    func makeJuice() {
        
    }
}
