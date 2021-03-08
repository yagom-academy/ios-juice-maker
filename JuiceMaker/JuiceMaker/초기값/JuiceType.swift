//
//  Juices.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/08.
//

import Foundation

typealias requirement = (Fruit: Fruit, needAmount: Int)

class Juice {
    var requirements: [requirement]
    
    init(require: [requirement]) {
        self.requirements = require
    }
    
    func canMake() -> Bool {
        for requirement in requirements {
            if requirement.Fruit.stock < requirement.needAmount {
                return false
            }
        }
        return true
    }
}

//var strawberryJuice = Juice(require: strawberryRequirement)
//var bananaJuice = Juice(require: bananaRequirement)
//var kiwiJuice = Juice(require: kiwiRequirement)
//var pineappleJuice = Juice(require: pineappleRequirement)
//var strawBananaJuice = Juice(require: strawBananaRequirement)
//var mangoJuice = Juice(require: mangoRequirement)
//var mangoKiwiJuice = Juice(require: mangoKiwiRequirement)


struct Juices : RawRepresentable {
    let rawValue: Juice
    static let strawberryJuice: Juice = Juice(require: strawberryRequirement)
    static let bananaJuice = Juice(require: bananaRequirement)
    static let kiwiJuice = Juice(require: kiwiRequirement)
    static let pineappleJuice = Juice(require: pineappleRequirement)
    static let strawBananaJuice = Juice(require: strawBananaRequirement)
    static let mangoJuice = Juice(require: mangoRequirement)
    static let mangoKiwiJuice = Juice(require: mangoKiwiRequirement)
}
