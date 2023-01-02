//
//  Recipe.swift
//  JuiceMaker
//
//  Created by Harry on 2023/01/02.
//

import Foundation

struct Recipe {
    let strawberryJuice: [Fruit: Int] = [
        .strawberry: 16
    ]
    let bananaJuice: [Fruit: Int] = [
        .banana: 2
    ]
    let kiwiJuice: [Fruit: Int] = [
        .kiwi: 3
    ]
    let pineappleJuice: [Fruit: Int] = [
        .pineapple: 2
    ]
    let strawberryBananaJuice: [Fruit: Int] = [
        .strawberry: 10,
        .banana: 1
    ]
    let mangoJuice: [Fruit: Int] = [
        .mango: 3
    ]
    let mangoKiwiJuice: [Fruit: Int] = [
        .mango: 2,
        .kiwi: 1
    ]
}
