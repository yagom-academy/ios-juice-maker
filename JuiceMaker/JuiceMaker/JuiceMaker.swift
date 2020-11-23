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
    case unknownRecipe
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
    let name: JuiceName
    var recipe: recipe
    
    init(name: JuiceName, recipe: recipe) {
        self.name = name
        self.recipe = recipe
    }
}

class JuiceMaker {
    private(set) var fruits: [FruitName: Fruit] = [
        .strawberry: Fruit(name: .strawberry),
        .banana: Fruit(name: .banana),
        .kiwi: Fruit(name: .kiwi),
        .mango: Fruit(name: .mango),
        .pineapple: Fruit(name: .pineapple)
    ]
 
    private(set) var recipes: [JuiceName: Recipe] = [
        .strawberryJuice: Recipe(name: .strawberryJuice, recipe: [.strawberry: 16]),
        .bananaJuice: Recipe(name: .bananaJuice, recipe: [.banana: 2]),
        .mangoJuice: Recipe(name: .mangoJuice, recipe: [.mango: 3]),
        .kiwiJuice: Recipe(name: .kiwiJuice, recipe: [.kiwi: 3]),
        .pineappleJuice: Recipe(name: .pineappleJuice, recipe: [.pineapple: 2]),
        .strawberryBananaJuice: Recipe(name: .strawberryBananaJuice, recipe: [.strawberry: 10, .banana: 1]),
        .mangoKiwiJuice: Recipe(name: .mangoKiwiJuice, recipe: [.mango: 2, .kiwi: 1])
    ]
    
    func make(juice: JuiceName) throws {
        guard let selectedjuice = recipes[juice] else {
            throw JuiceMakerError.unknownRecipe
        }
        
        for (neededfruit, neededAmount) in selectedjuice.recipe {
            guard let neededFruit = fruits[neededfruit] else {
                throw JuiceMakerError.unknownFruit
            }

            guard neededFruit.isEnough(amount: neededAmount) else {
                throw JuiceMakerError.outOfStock
            }
        }
        
        for (neededfruit, neededAmount) in selectedjuice.recipe {
            guard let neededFruit = fruits[neededfruit] else {
                throw JuiceMakerError.unknownFruit
            }
            neededFruit.use(amount: neededAmount)
        }
    }
}
    

