//
//  Juices.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/08.
//

typealias FruitAndNeedAmount = (Fruit: Fruit, needAmount: Int)

class Juice {
    let requirements: [FruitAndNeedAmount]
    
    init(_ require: [FruitAndNeedAmount]) {
        self.requirements = require
    }
    
    var canMake: Bool {
        for requirement in requirements {
            if requirement.Fruit.stock < requirement.needAmount {
                return false
            }
        }
        return true
    }
}

enum JuiceType {
    static let strawberry = Juice(Requirements.strawberry)
    static let banana = Juice(Requirements.banana)
    static let kiwi = Juice(Requirements.kiwi)
    static let pineapple = Juice(Requirements.pineapple)
    static let strawBanana = Juice(Requirements.strawBanana)
    static let mango = Juice(Requirements.mango)
    static let mangoKiwi = Juice(Requirements.mangoKiwi)
}
