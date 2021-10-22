//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case kiwiMangoJuice
        
        var recipe: [FruitStore.Fruits: Int] {
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
            case .kiwiMangoJuice:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    let fruitStorage: FruitStore
    
    func order(juice: Juice) -> Juice? {
        return canMake(juice: juice) ? make(juice: juice) : nil
    }
    
    private func canMake(juice: Juice) -> Bool {
        for (fruit, count) in juice.recipe {
            if fruitStorage.hasStock(of: fruit, count: count) == false {
                return false
            }
        }
        return true
    }
    
    private func make(juice: Juice) -> Juice {
        juice.recipe.forEach { fruitStorage.subtract(fruit: $0, of: $1) }
        return juice
    }
}
