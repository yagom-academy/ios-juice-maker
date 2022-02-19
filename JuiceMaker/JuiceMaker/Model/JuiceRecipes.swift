//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by 김정상 on 2022/02/16.
//

import Foundation

protocol RecipeProtocol {
    var items: FruitItems { get }
}

struct StrawberryJuice: RecipeProtocol {
    var items: FruitItems = [
        .strawberry: 16
    ]
}

struct BananaJuice: RecipeProtocol {
    var items: FruitItems = [
        .banana: 2
    ]
}

struct PineappleJuice: RecipeProtocol {
    var items: FruitItems = [
        .pineapple: 2
    ]
}

struct KiwiJuice: RecipeProtocol {
    var items: FruitItems = [
        .kiwi: 3
    ]
}

struct MangoJuice: RecipeProtocol {
    var items: FruitItems = [
        .mango: 3
    ]
}

struct StrawberryBananaJuice: RecipeProtocol {
    var items: FruitItems = [
        .strawberry: 10,
        .banana: 1
    ]
}

struct MangoKiwiJuice: RecipeProtocol {
    var items: FruitItems = [
        .mango: 2,
        .kiwi: 1
    ]
}
