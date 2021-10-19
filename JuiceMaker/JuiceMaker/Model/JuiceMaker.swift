//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    enum JuiceMakerError: Error {
        case outOfStock
    }
    
    enum JuiceMenu {
        var juiceRecipe: Dictionary<Fruit, Int> {
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
    
    func makeJuice(order: JuiceMenu) throws {
        let recipes: [Fruit : Int] = order.juiceRecipe
        
        guard isRemaining(of: recipes) else {
            throw JuiceMakerError.outOfStock
        }
        
        for recipe in recipes {
            let fruit: Fruit = recipe.key
            let count: Int = recipe.value
            
            fruitStore.changeQuantity(of: fruit, count: count, by: -)
        }
    }
    
    private func isRemaining(of recipes: [Fruit : Int]) -> Bool {
        for recipe in recipes {
            let count: Int = recipe.value
            
            guard let fruitQuantity: Int = fruitStore.fruitQuantity[recipe.key], fruitQuantity - count >= 0 else {
                return false
            }
        }
        return true
    }
}
