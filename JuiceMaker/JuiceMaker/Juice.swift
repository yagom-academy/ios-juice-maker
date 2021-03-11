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
    static let strawberryJuice = Juice(Requirements.strawberry)
    static let bananaJuice = Juice(Requirements.banana)
    static let kiwiJuice = Juice(Requirements.kiwi)
    static let pineappleJuice = Juice(Requirements.pineapple)
    static let strawBananaJuice = Juice(Requirements.strawBanana)
    static let mangoJuice = Juice(Requirements.mango)
    static let mangoKiwiJuice = Juice(Requirements.mangoKiwi)
}
