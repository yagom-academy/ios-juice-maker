//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

//struct JuiceMaker {
//    let fruitStore = FruitStore()
//
//    enum Juice {
//        case strawberryJuice
//        case bananaJuice
//        case kiwiJuice
//        case pineappleJuice
//        case strawberryBananaJuice
//        case mangoJuice
//        case mangoKiwiJuice
//
//
//        var ingredient: (first: FruitStore.Fruit, second: FruitStore.Fruit?) {
//            switch self {
//            case .strawberryJuice:
//                return (.strawberry, nil)
//            case .bananaJuice:
//                return (.banana, nil)
//            case .kiwiJuice:
//                return (.kiwi, nil)
//            case .pineappleJuice:
//                return (.pineapple, nil)
//            case .strawberryBananaJuice:
//                return (.strawberry, .banana)
//            case .mangoJuice:
//                return (.mango, nil)
//            case .mangoKiwiJuice:
//                return (.mango, .kiwi)
//            }
//        }
//
//        func ingredientsCount() -> (first: Int, second: Int) {
//            switch self {
//            case .strawberryJuice:
//                return (16, 0)
//            case .bananaJuice:
//                return (2,0)
//            case .kiwiJuice:
//                return (3,0)
//            case .pineappleJuice:
//                return (2,0)
//            case .strawberryBananaJuice:
//                return (10, 1)
//            case .mangoJuice:
//                return (3,0)
//            case .mangoKiwiJuice:
//                return (2,1)
//            }
//        }
//    }
//
//    func makeJuice(_ juice: Juice, total: Int) {
//        let ingredients = juice.ingredientsCount()
//
//        switch juice {
//        case .strawberryJuice, .bananaJuice, .kiwiJuice, .pineappleJuice, .mangoJuice:
//            guard checkStockOf(fruit: juice.ingredient.first, count: ingredients.first * total) else {
//                return
//            }
//            fruitStore.changeStockOf(fruit: juice.ingredient.first, by: -ingredients.first * total)
//        case .strawberryBananaJuice, .mangoKiwiJuice:
//            guard let secondIngredient = juice.ingredient.second else {
//                return
//            }
//            guard checkStockOf(fruit: juice.ingredient.first, count: ingredients.first * total),
//                  checkStockOf(fruit: secondIngredient, count: ingredients.second * total) else {
//                return
//            }
//            fruitStore.changeStockOf(fruit: juice.ingredient.first, by: -ingredients.first * total)
//            fruitStore.changeStockOf(fruit: secondIngredient, by: -ingredients.second * total)
//        }
//    }
//
//    func checkStockOf(fruit: FruitStore.Fruit, count: Int) -> Bool {
//        guard let currentStock = fruitStore.fruitStock[fruit] else {
//            return false
//        }
//
//        guard currentStock >= count else {
//            return false
//        }
//
//        return true
//    }
//}

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
        var recipe: Dictionary<FruitStore.Fruit, Int> {
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
    
    func makeJuice(_ juice: Juice, total: Int) {
        guard checkStockOf(juice, total: total) else {
            return
        }
        
        let recipe = juice.recipe
        
        for (ingredient, quantity) in recipe {
            fruitStore.changeStockOf(fruit: ingredient, by: -(quantity * total))
        }
        print("\(juice) 한 잔 완성")
    }
    
    func checkStockOf(_ juice: Juice, total: Int) -> Bool {
        let recipe = juice.recipe
        
        for (ingredient, quantity) in recipe {
            guard let currentStock = fruitStore.fruitStock[ingredient] else {
                return false
            }
            
            guard currentStock >= quantity * total else {
                return false
            }
        }
        
        return true
    }
}
