//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case kiwiMangoJuice
        
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
    
    enum MakingJuiceError: LocalizedError {
        case soldOut
    }
    
    let fruitStorage: FruitStore
    
    func order(juice: Juice) throws {
        do {
            try make(juice: juice)
        } catch FruitStore.InventoryManageError.outOfStock {
            throw MakingJuiceError.soldOut
        }
    }
    
    func make(juice: Juice) throws {
        let juiceRecipe = juice.recipe()
        
        for (fruit, count) in juiceRecipe {
            try fruitStorage.subtractFruit(fruit, of: count)
        }
    }
}
