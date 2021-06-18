//
//  EnumTypes.swift
//  JuiceMaker
//
//  Created by Yongwoo Marco on 2021/06/15.
//

struct Juice {
    var name: String
    var ingredients: Dictionary<Fruit, Int>
}

var strawberryJuice = Juice(name: "딸기쥬스", ingredients: [.strawberry:16])
var bananaJuice = Juice(name: "바나나쥬스", ingredients: [.banana:2])
var pineappleJuice = Juice(name: "파인애플쥬스", ingredients: [.pineapple:2])
var kiwiJuice = Juice(name: "키위쥬스", ingredients: [.kiwi:3])
var mangoJuice = Juice(name: "망고쥬스", ingredients: [.mango:3])
var strawberryBananaJuice = Juice(name: "딸바쥬스", ingredients: [.strawberry:10, .banana:1])
var mangoKiwiJuice = Juice(name: "망키쥬스", ingredients: [.mango:2, .kiwi:1])
