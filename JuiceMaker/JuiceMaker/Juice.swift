//
//  Juices.swift
//  JuiceMaker
//
//  Created by 천수현 on 2021/03/08.
//

typealias FruitAndNeedAmount = (Fruit: Fruit, needAmount: Int)

class Juice {
    private(set) var requirements: [FruitAndNeedAmount]
    let name: String
    init(_ require: [FruitAndNeedAmount], _ juiceName: String) {
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
    static let strawberry = Juice(Requirements.strawberry, "딸기쥬스")
    static let banana = Juice(Requirements.banana, "바나나쥬스")
    static let kiwi = Juice(Requirements.kiwi, "키위쥬스")
    static let pineapple = Juice(Requirements.pineapple, "파인애플쥬스")
    static let strawBanana = Juice(Requirements.strawBanana, "딸바쥬스")
    static let mango = Juice(Requirements.mango, "망고쥬스")
    static let mangoKiwi = Juice(Requirements.mangoKiwi, "망키쥬스")
}
