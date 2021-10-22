//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

//import Foundation

enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoJuice
    case mangoKiwiJuice
    
    fileprivate var recipes: [Fruit: Int] {
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
            return [.strawberry: 10 , .banana: 1]
        case .mangoJuice:
            return [.mango: 3]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 3]
        }
    }
}

struct JuiceMaker {
    let fruitStore: FruitStore
    
    private func checkStock(of juice: Juice) throws {
        let recipe = juice.recipes
        
        for (fruit, amount) in recipe {
            guard try fruitStore.takeOutStock(fruit: fruit) >= amount else {
                throw StockError.notEnoughStock
            }
        }
    }
    
    private func consumeStock(with juice: Juice) throws {
        let recipes = juice.recipes
        
        for (fruit, amount) in recipes {
            guard try fruitStore.takeOutStock(fruit: fruit) >= amount else {
                throw StockError.notEnoughStock
            }
            
            try fruitStore.decreaseStock(from: fruit, by: amount)
        }
    }
}
