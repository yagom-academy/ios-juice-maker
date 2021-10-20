//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import UIKit

struct JuiceMaker {
    enum Menu {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case mangoJuice
        case strawberryBananaJuice
        case mangoKiwiJuice
        
        var ingredient: [Fruit] {
            switch self {
            case .strawberryJuice:
                return [Fruit(fruitName: .strawberry, quantity: 16)]
            case .bananaJuice:
                return [Fruit(fruitName: .banana, quantity: 2)]
            case .kiwiJuice:
                return [Fruit(fruitName: .kiwi, quantity: 3)]
            case .pineappleJuice:
                return [Fruit(fruitName: .pineapple, quantity: 2)]
            case .mangoJuice:
                return [Fruit(fruitName: .mango, quantity: 3)]
            case .strawberryBananaJuice:
                return [Fruit(fruitName: .strawberry, quantity: 10), Fruit(fruitName: .banana, quantity: 1)]
            case .mangoKiwiJuice:
                return [Fruit(fruitName: .mango, quantity: 2), Fruit(fruitName: .kiwi, quantity: 1)]
            }
        }
    }
    
    var fruitStore: FruitStore = FruitStore()
    
    func make(singleJuice: Menu) -> Bool {
        guard fruitStore.checkQuantity(singleJuice.ingredient[0]) else {
            print("\(singleJuice.ingredient[0].name)가 충분하지 않습니다")
            return false
        }
        
        guard fruitStore.bringIngredients(singleJuice.ingredient[0]) else {
            print("\(singleJuice)가 만들어지지 못했습니다")
            return false
        }
    
        return true
    }
    
    func make(mixedJuice: Menu) -> Bool {
        guard fruitStore.checkQuantity(mixedJuice.ingredient[0]) else {
            print("\(mixedJuice.ingredient[0].name)가 충분하지 않습니다")
            return false
        }
                
        guard fruitStore.checkQuantity(mixedJuice.ingredient[1]) else {
            print("\(mixedJuice.ingredient[1].name)가 충분하지 않습니다")
            return false
        }
        
        guard fruitStore.bringIngredients(mixedJuice.ingredient[0]) else {
            print("\(mixedJuice)가 만들어지지 못했습니다")
            return false
        }
        guard fruitStore.bringIngredients(mixedJuice.ingredient[1]) else {
            print("\(mixedJuice)가 만들어지지 못했습니다")
            return false
        }
    
        return true
    }
}
