//
//  JuiceMaker - JuiceMaker.swift
//  Created by safari and Red. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation



enum JuiceMakeError: Error {
    case lackOfStock
}

extension Juice {
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

struct JuiceMaker {
    let fruitStore = FruitStore()
    
    func orderAndCheck(_ juice: Juice) -> Bool {
        do {
            try takeOrder(juice)
        } catch {
            return false
        }
        return true
    }
    
    private func takeOrder(_ juice: Juice) throws {
        if canMake(of: juice) {
            make(juice)
        } else {
            throw JuiceMakeError.lackOfStock
        }
    }
    
    private func canMake(of juice: Juice) -> Bool {
        var checkList: [Bool] = []
        for ingredient in juice.recipe {
            checkList.append(fruitStore.isEnoughStock(of: ingredient))
        }
        return checkList.allSatisfy{ $0 }
    }
    
    private func make(_ juice: Juice) {
        for ingredient in juice.recipe {
            let (neededFruit, neededStock) = ingredient
            fruitStore.changeStock(of: neededFruit, to: -neededStock)
        }
    }
    func initLable() {
        for i in Fruit.allCases {
            fruitStore.changeStock(of: i, to: .zero)
        }
    }
    
}
