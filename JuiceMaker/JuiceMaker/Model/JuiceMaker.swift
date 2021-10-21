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
    }
    
    let fruitStorage: FruitStore
    
    func order(juice: Juice) -> Juice? {
        
        if canMake(juice: juice) {
            return make(juice: juice)
        } else {
            return nil
        }
    }
    
    func canMake(juice: Juice) -> Bool {
        let juiceRecipe = juice.recipe()
        
        for (fruit, count) in juiceRecipe {
            if fruitStorage.hasStock(of: fruit, count: count) == false {
                return false
            }
        }
        return true
    }
    
    private func make(juice: Juice) -> Juice {
        let juiceRecipe = juice.recipe()
        
        for (fruit, count) in juiceRecipe {
            fruitStorage.subtractFruit(fruit, of: count)
        }
        return juice
    }
}

private extension JuiceMaker.Juice {
    func recipe() -> [FruitStore.Fruits: Int] {
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
