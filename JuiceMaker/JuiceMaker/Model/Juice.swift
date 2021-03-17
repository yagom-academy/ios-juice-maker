//
//  Juices.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/08.
//


class Juice {
    private(set) var requirements: [(Fruit: Fruit, needAmount: Int)]
    let name: String
    
    init(require: [(Fruit: Fruit, needAmount: Int)], juiceName: String) {
        self.requirements = require
        self.name = juiceName
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
    static let strawberry = Juice(require: Requirements.strawberry, juiceName: "딸기쥬스")
    static let banana = Juice(require: Requirements.banana, juiceName: "바나나쥬스")
    static let kiwi = Juice(require: Requirements.kiwi, juiceName: "키위쥬스")
    static let pineapple = Juice(require: Requirements.pineapple, juiceName: "파인애플쥬스")
    static let strawBanana = Juice(require: Requirements.strawBanana, juiceName: "딸바쥬스")
    static let mango = Juice(require: Requirements.mango, juiceName: "망고쥬스")
    static let mangoKiwi = Juice(require: Requirements.mangoKiwi, juiceName: "망키쥬스")
}
