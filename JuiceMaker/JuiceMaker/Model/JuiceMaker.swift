//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import UIKit

struct JuiceMaker {
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
        var recipe: [Fruit] {
            switch self {
            case .strawberryJuice:
                return [Fruit(fruitName: .strawberry, count: 16)]
            case .bananaJuice:
                return [Fruit(fruitName: .banana, count: 2)]
            case .kiwiJuice:
                return [Fruit(fruitName: .kiwi, count: 3)]
            case .pineappleJuice:
                return [Fruit(fruitName: .pineapple, count: 2)]
            case .strawberryBananaJuice:
                return [Fruit(fruitName: .strawberry, count: 10), Fruit(fruitName: .banana, count: 1)]
            case .mangoJuice:
                return [Fruit(fruitName: .mango, count: 3)]
            case .mangoKiwiJuice:
                return [Fruit(fruitName: .mango, count: 2), Fruit(fruitName: .kiwi, count: 1)]
            }
        }
    }
    
    var fruitStore: FruitStore = FruitStore()
    
    func makeJuice(ingredient: Juice) -> Bool {
        let haveEnoughIngredient = fruitStore.checkQuantity(requiredIngredient: ingredient.recipe[0])
        
        guard haveEnoughIngredient else {
            print("\(ingredient.recipe[0].name)가 충분하지 않습니다")
            return false
        }
        
        guard fruitStore.bringIngredients(ingredients: ingredient.recipe[0]) else {
            print("\(ingredient.recipe[0].name)주스가 만들어지지 못했습니다")
            return false
        }
    
        return true
    }
}
