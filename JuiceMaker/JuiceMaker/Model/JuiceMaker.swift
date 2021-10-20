//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore = FruitStore()
    
    enum JuiceMakerError: Error {
        case outOfStock
    }
    
    enum Menu {
        var recipe: Dictionary<Fruit, Int> {
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
        
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
    }
    
    func makeJuice(seletedJuice: Menu) throws {
        let ingredients: [Fruit : Int] = seletedJuice.recipe
        
        guard isRemaining(of: ingredients) else {
            throw JuiceMakerError.outOfStock
        }
        
        for (fruit, count) in ingredients {
            fruitStore.changeQuantity(of: fruit, count: count, do: -)
        }
    }
    
    private func isRemaining(of ingredients: [Fruit : Int]) -> Bool {
        for (fruit, count) in ingredients {
            
            guard let fruitQuantity = fruitStore.fruitQuantity[fruit], fruitQuantity >= count else {
                return false
            }
        }
        return true
    }
}
