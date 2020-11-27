//
//  JuiceMaker.swift
//  JuiceMaker
//
//  Created by Lina Lim on 11/16/20.
//  Copyright © 2020 llim. All rights reserved.
//

import Foundation

typealias Recipe = [Fruit.Name: UInt]

enum Message: String {
    case success = " 나왔습니다. 맛있게 드세요."
    case outOfStock = "재고가 모자라요. 재고를 수정할까요?"
    case machineError = "관리자에게 문의해주세요."
}

enum JuiceMakerError: Error {
    case outOfStock
    case unknownFruit
}

enum Juice: Int {
    case strawberryJuice = 0
    case bananaJuice = 1
    case mangoJuice = 2
    case kiwiJuice = 3
    case pineappleJuice = 4
    case strawberryBananaJuice = 5
    case mangoKiwiJuice = 6
    
    var describtion: String {
        switch self {
        case .strawberryJuice:
            return "딸기 쥬스"
        case .bananaJuice:
            return "바나나 쥬스"
        case .mangoJuice:
            return "망고 쥬스"
        case .kiwiJuice:
            return "키위 쥬스"
        case .pineappleJuice:
            return "파인애플 쥬스"
        case .strawberryBananaJuice:
            return "딸기바나나 쥬스"
        case .mangoKiwiJuice:
            return "망고키위 쥬스"
        }
    }
    
    var recipe: Recipe {
        switch self {
        case .strawberryJuice:
            return [.strawberry : 16]
        case .bananaJuice:
            return [.banana : 2]
        case .mangoJuice:
            return [.mango : 3]
        case .kiwiJuice:
            return [.kiwi : 3]
        case .pineappleJuice:
            return [.pineapple : 2]
        case .strawberryBananaJuice:
            return [.strawberry : 10, .banana : 1]
        case .mangoKiwiJuice:
            return [.mango : 2, .kiwi : 1]
        }
    }
}

class Fruit {
    enum Name: Int {
        case strawberry = 0
        case banana = 1
        case mango = 2
        case kiwi = 3
        case pineapple = 4
    }
    
    let name: Fruit.Name
    private(set) var amount: UInt
    
    init(name: Fruit.Name, initialStock: UInt = 10) {
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
    static let common = JuiceMaker()
    private init() {}
    
    private(set) var fruits: [Fruit.Name : Fruit] = [
        .strawberry : Fruit(name : .strawberry),
        .banana : Fruit(name : .banana),
        .kiwi : Fruit(name : .kiwi),
        .mango : Fruit(name : .mango),
        .pineapple : Fruit(name : .pineapple)
    ]
    
    func make(juice: Juice) throws {
        for (neededFruit, neededAmount) in juice.recipe {
            guard let fruit = fruits[neededFruit] else {
                throw JuiceMakerError.unknownFruit
            }

            guard fruit.isEnough(amount: neededAmount) else {
                throw JuiceMakerError.outOfStock
            }
        }
        
        for (neededFruit, neededAmount) in juice.recipe {
            guard let fruit = fruits[neededFruit] else {
                throw JuiceMakerError.unknownFruit
            }
            fruit.use(amount: neededAmount)
        }
    }
}
