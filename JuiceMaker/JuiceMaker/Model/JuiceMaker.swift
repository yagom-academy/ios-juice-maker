//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct Juice {
    var name: JuiceName
    var count: Int = 0
    
    enum JuiceName {
        case strawberryJuice
        case bananaJuice
        case kiwiJuice
        case pineappleJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
    }
}

// 쥬스 메이커 타입
struct JuiceMaker {
    var store = FruitStore()
    
    typealias ingredient = (fruit: Fruit.FruitName, count: Int)
    
    let strawberryJuiceRecipe: [ingredient] = [(.strawberry, 16)]
    let bananaJuiceRecipe: [ingredient] = [(.banana, 2)]
    let kiwiJuiceRecipe: [ingredient] = [(.kiwi, 3)]
    let pineappleJuiceRecipe: [ingredient] = [(.pineapple, 2)]
    let strawberryBananaJuiceRecipe: [ingredient] = [(.strawberry, 10), (.banana, 1)]
    let mangoJuiceRecipe: [ingredient] = [(.mango, 3)]
    let mangoKiwiJuiceRecipe: [ingredient] = [(.mango, 2), (.kiwi, 1)]
    
    lazy var recipe: [Juice.JuiceName: [ingredient]] = [
        .strawberryJuice: strawberryJuiceRecipe,
        .bananaJuice: bananaJuiceRecipe,
        .kiwiJuice: kiwiJuiceRecipe,
        .pineappleJuice: pineappleJuiceRecipe,
        .strawberryBananaJuice: strawberryBananaJuiceRecipe,
        .mangoJuice: mangoJuiceRecipe,
        .mangoKiwiJuice: mangoKiwiJuiceRecipe
    ]
}
