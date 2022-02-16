//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by 김정상 on 2022/02/16.
//

import Foundation

protocol RecipeProtocol {
    var recipe: [FruitType: Int] { get }
}

struct StrawberryJuice: RecipeProtocol {
    var recipe: [FruitType: Int] = [
        .strawberry: 16
    ]
}

struct BananaJuice: RecipeProtocol {
    var recipe: [FruitType: Int] = [
        .banana: 2
    ]
}

struct PineappleJuice: RecipeProtocol {
    var recipe: [FruitType: Int] = [
        .pineapple: 2
    ]
}

struct KiwiJuice: RecipeProtocol {
    var recipe: [FruitType: Int] = [
        .kiwi: 3
    ]
}

struct MangoJuice: RecipeProtocol {
    var recipe: [FruitType: Int] = [
        .mango: 3
    ]
}

struct StrawberryBananaJuice: RecipeProtocol {
    var recipe: [FruitType: Int] = [
        .strawberry: 10,
        .banana: 1
    ]
}

struct MangoKiwiJuice: RecipeProtocol {
    var recipe: [FruitType: Int] = [
        .mango: 2,
        .kiwi: 1
    ]
}
