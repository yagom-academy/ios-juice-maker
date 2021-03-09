//
//  Juices.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/08.
//

typealias FruitAndNeedAmount = (Fruit: Fruit, needAmount: Int)

class Juice {
    let requirements: [FruitAndNeedAmount]
    
    init(require: [FruitAndNeedAmount]) {
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
    static let strawberryJuice = Juice(require: Requirements.strawberryRequirement)
    static let bananaJuice = Juice(require: Requirements.bananaRequirement)
    static let kiwiJuice = Juice(require: Requirements.kiwiRequirement)
    static let pineappleJuice = Juice(require: Requirements.pineappleRequirement)
    static let strawBananaJuice = Juice(require: Requirements.strawBananaRequirement)
    static let mangoJuice = Juice(require: Requirements.mangoRequirement)
    static let mangoKiwiJuice = Juice(require: Requirements.mangoKiwiRequirement)
}

