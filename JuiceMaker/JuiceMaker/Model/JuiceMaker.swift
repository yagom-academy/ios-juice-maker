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
                return [(.strawberry, 16)]
            case .bananaJuice:
                return [(.banana, 2)]
            case .pineappleJuice:
                return [(.pineapple, 2)]
            case .kiwiJuice:
                return [(.kiwi, 3)]
            case .mangoJuice:
                return [(.mango, 3)]
            case .strawberryAndBananaJuice:
                return [(.strawberry, 10), (.banana, 1)]
            case .mangoAndKiwiJuice:
                return [(.mango, 2), (.kiwi, 1)]
                
            }
        }
    }
    
    func takeOrder(_ juice: Juice) {
        if checkAllStock(of: juice) {
            makeJuice(juice)
        } else {
            print("과일의 재고가 부족합니다.")
        }
    }
    
    private func checkAllStock(of juice: Juice) -> Bool {
        let countOfIngredient = juice.recipe.count
        var checkList: [Bool] = []
        for count in Int.zero..<countOfIngredient {
            checkList.append(checkOneStock(of: juice, with: count))
        }
        return checkList.allSatisfy{ (check: Bool) -> Bool in
            return check == true
        }
    }
    
    private func makeJuice(_ juice: Juice) {
        for list in Int.zero..<juice.recipe.count {
            let (neededFruit, neededStock) = juice.recipe[list]
            let inStock = fruitStore.stock[neededFruit] ?? Int.zero
            fruitStore.changeStock(of: neededFruit, to: inStock - neededStock)
            print("\(juice) 나왔습니다.")
        }
    }
    
    
}


