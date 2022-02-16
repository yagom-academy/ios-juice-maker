//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by 김정상 on 2022/02/16.
//

import Foundation

protocol RecipeProtocol {
    var items: [FruitType: Int] { get }
}

struct StrawberryJuice: RecipeProtocol {
    var items: [FruitType: Int] = [
        .strawberry: 16
    ]
}

struct BananaJuice: RecipeProtocol {
    var items: [FruitType: Int] = [
        .banana: 2
    ]
}

struct PineappleJuice: RecipeProtocol {
    var items: [FruitType: Int] = [
        .pineapple: 2
    ]
}

struct KiwiJuice: RecipeProtocol {
    var items: [FruitType: Int] = [
        .kiwi: 3
    ]
}

struct MangoJuice: RecipeProtocol {
    var items: [FruitType: Int] = [
        .mango: 3
    ]
}

struct StrawberryBananaJuice: RecipeProtocol {
    var items: [FruitType: Int] = [
        .strawberry: 10,
        .banana: 1
    ]
}

struct MangoKiwiJuice: RecipeProtocol {
    var items: [FruitType: Int] = [
        .mango: 2,
        .kiwi: 1
    ]
}
