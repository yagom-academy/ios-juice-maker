//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by Lina Lim on 11/16/20.
//  Copyright © 2020 llim. All rights reserved.
//

import Foundation

enum JuiceMakerError: Error {
    case outOfStock
    case unknownFruit
}

enum JuiceName: String {
    case strawberryJuice = "딸기 쥬스"
    case bananaJuice = "바나나 쥬스"
    case mangoJuice = "망고 쥬스"
    case kiwiJuice = "키위 쥬스"
    case pineappleJuice = "파인애플 쥬스"
    case strawberryBananaJuice = "딸기바나나 쥬스"
    case mangoKiwiJuice = "키위망고 쥬스"
}

enum FruitName: String {
    case strawberry = "딸기"
    case banana = "바나나"
    case mango = "망고"
    case kiwi = "키위"
    case pineapple = "파인애플"
}

class Fruit {
    let name: FruitName
    private(set) var amount: UInt
    
    init(name: FruitName, initialStock: UInt = 10) {
        self.name = name
        self.amount = initialStock
    }
    
    func supply(amount: UInt) {
        self.amount += amount
    }
    
    func use(amount: UInt) {
        self.amount -= amount
    }
    
    func isEnough(amount: UInt) -> Bool {
        return self.amount >= amount
    }
}

typealias recipe = [FruitName: UInt]

struct Recipe {
    let strawberryJuice: recipe = [.strawberry: 16]
    let bananaJuice: recipe = [.banana: 2]
    let mangoJuice: recipe = [.mango: 3]
    let kiwiJuice: recipe = [.kiwi: 3]
    let pineappleJuice: recipe = [.pineapple: 2]
    let strawberryBananaJuice: recipe = [.strawberry: 10, .banana: 1]
    let mangoKiwiJuice: recipe = [.mango: 2, .kiwi: 1]
}

class JuiceMaker {
    let recipes = Recipe()
    private(set) var fruits: [FruitName: Fruit] = [
        .strawberry: Fruit(name: .strawberry),
        .banana: Fruit(name: .banana),
        .kiwi: Fruit(name: .kiwi),
        .mango: Fruit(name: .mango),
        .pineapple: Fruit(name: .pineapple)
    ]
  
    func make(juice: JuiceName) throws {
        let recipe = recipes.strawberryJuice
        
        for (neededfruit, neededAmount) in recipe {
            guard let neededFruit = fruits[neededfruit] else {
                throw JuiceMakerError.unknownFruit
            }
            
            guard neededFruit.isEnough(amount: neededAmount) else {
                throw JuiceMakerError.outOfStock
            }
        }
        
        for (neededfruit, neededAmount) in recipe {
            guard let neededFruit = fruits[neededfruit] else {
                throw JuiceMakerError.unknownFruit
            }
            neededFruit.use(amount: neededAmount)
        }
    }
}
    

