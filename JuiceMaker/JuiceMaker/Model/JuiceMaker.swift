//
//  JuiceMaker - JuiceMaker.swift
//  Created by som, LJ. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStorage = FruitStore(defaultStack: 10)
    
    func makeJuice(of juice: Juice) throws {
        try chooseRecipe(order: juice)
    }
    
    func chooseRecipe(order juice: Juice) throws {
        switch juice {
        case .strawberryBananaJuice, .mangoKiwiJuice:
            if let (fruit, amount) = juice.recipeOFJuice.second {
                try fruitStorage.changeFruitStock(fruit: fruit, amount: amount)
            }
        default:
            let (fruit, amount) = juice.recipeOFJuice.first
            try fruitStorage.changeFruitStock(fruit: fruit, amount: amount)
        }
    }
}
