//
//  FruitJuice.swift
//  JuiceMaker
//
//  Created by Yeon on 2020/11/25.
//

enum FruitJuice: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플쥬스"
    case mangoJuice = "망고쥬스"
    case strawberryBananaJuice = "딸기바나나쥬스"
    case mangoKiwiJuice = "망고키위쥬스"
    case none
}

struct JuiceReceipt {
    let name: FruitJuice
    let fruits: [FruitsNeedToMakeRecipe]
    init(name: FruitJuice, fruits: [FruitsNeedToMakeRecipe]) {
        self.name = name
        self.fruits = fruits
    }
}

struct FruitsNeedToMakeRecipe {
    let name: FruitType
    let need: Int
    init(name: FruitType, need: Int){
        self.name = name
        self.need = need
    }
}

struct Juice {
    let fruitJuices: [JuiceReceipt] = [
        JuiceReceipt(name: .strawberryJuice, fruits: [.init(name: .strawberry, need: 16)]),
        JuiceReceipt(name: .bananaJuice, fruits: [.init(name: .banana, need: 2)]),
        JuiceReceipt(name: .kiwiJuice, fruits: [.init(name: .kiwi, need: 3)]),
        JuiceReceipt(name: .pineappleJuice, fruits: [.init(name: .pineapple, need: 2)]),
        JuiceReceipt(name: .mangoKiwiJuice, fruits: [.init(name: .mango, need: 3)]),
        JuiceReceipt(name: .strawberryBananaJuice, fruits: [.init(name: .strawberry, need: 10),.init(name: .banana, need: 1)]),
        JuiceReceipt(name: .mangoKiwiJuice, fruits: [.init(name: .mango, need: 2),.init(name: .kiwi, need: 1)])
    ]
}

