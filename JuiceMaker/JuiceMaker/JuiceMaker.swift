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
    case unknownRecipe
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

class JuiceMaker {
    private(set) var fruits: [FruitName: Fruit] = [
        .strawberry: Fruit(name: .strawberry),
        .banana: Fruit(name: .banana),
        .kiwi: Fruit(name: .kiwi),
        .mango: Fruit(name: .mango),
        .pineapple: Fruit(name: .pineapple)
    ]

    private(set) var recipes: [JuiceName: [FruitName: UInt]] = [
        .strawberryJuice: [.strawberry: 16],
        .bananaJuice: [.banana: 2],
        .mangoJuice: [.mango: 3],
        .kiwiJuice: [.kiwi: 3],
        .pineappleJuice: [.pineapple: 2],
        .strawberryBananaJuice: [.strawberry: 10, .banana: 1],
        .mangoKiwiJuice: [.mango: 2, .kiwi: 1]
    ]
    
    func make(juice: JuiceName) throws {
        guard let recipe = recipes[juice] else {
            throw JuiceMakerError.unknownRecipe
        }
        
        for (fruit, amount) in recipe {
            guard let neededFruit = fruits[fruit] else {
                throw JuiceMakerError.unknownFruit
            }
            
            guard neededFruit.isEnough(amount: amount) else {
                throw JuiceMakerError.outOfStock
            }
        }
        
        for (fruit, amount) in recipe {
            fruits[fruit]!.use(amount: amount)
        }
        
        alertMakingSuccess(juice: juice)
    }
}

func alertMakingSuccess(juice: JuiceName) {
    let message: String = "\(juice.rawValue) 나왔습니다! 맛있게 드세요!"
    print(message)
}
