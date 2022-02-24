//
//  JuiceMaker - JuiceMaker.swift
//  Created by safari and Red. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    private var fruitStore: FruitStore = FruitStore()
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case mangoJuice
        case strawberryAndBananaJuice
        case mangoAndKiwiJuice
        
        var recipe: [(Fruit, Int)] {
            switch self {
            case .strawberryJuice:
                return [(Fruit.strawberry, 16)]
            case .bananaJuice:
                return [(Fruit.banana, 2)]
            case .pineappleJuice:
                return [(Fruit.pineapple, 2)]
            case .kiwiJuice:
                return [(Fruit.kiwi, 3)]
            case .mangoJuice:
                return [(Fruit.mango, 3)]
            case .strawberryAndBananaJuice:
                return [(Fruit.strawberry, 10), (Fruit.banana, 1)]
            case .mangoAndKiwiJuice:
                return [(Fruit.mango, 2), (Fruit.kiwi, 1)]
                
            }
        }
    }
    
    func orderJuice(_ juice: Juice) {
        if checkAllStock(of: juice) {
            makeJuice(juice)
        } else {
            print("과일의 재고가 부족합니다.")
        }
    }
    
    private func checkAllStock(of juice: Juice) -> Bool {
        let listOfIngredient = juice.recipe.count
        for list in Int.zero..<listOfIngredient {
            guard checkOneStock(of: juice, with: list) else {
                return false
            }
        }
        return true
    }
    
    private func checkOneStock(of juice: Juice, with listOfIngredient: Int) -> Bool {
        let (neededFruit, neededStock) = juice.recipe[listOfIngredient]
        let inStock: Int = fruitStore.stock[neededFruit] ?? Int.zero
        if inStock >= neededStock {
            return true
        } else {
            return false
        }
    }
    
    private func makeJuice(_ juice: Juice) {
        for list in Int.zero..<juice.recipe.count {
            let (neededFruit, neededStock) = juice.recipe[list]
            let inStock = fruitStore.stock[neededFruit] ?? Int.zero
            fruitStore.updateStock(of: neededFruit, to: inStock - neededStock)
            print("\(juice) 나왔습니다.")
        }
    }
}


