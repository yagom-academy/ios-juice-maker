//
//  JuiceType.swift
//  JuiceMaker
//
//  Created by 김정상 on 2022/02/16.
//

import Foundation

protocol RecipeProtocol {
    var items: FruitsInventory { get }
}

struct StrawberryJuice: RecipeProtocol {
    var items: FruitsInventory = [
        .strawberry: 16
    ]
}

struct BananaJuice: RecipeProtocol {
    var items: FruitsInventory = [
        .banana: 2
    ]
}

struct PineappleJuice: RecipeProtocol {
    var items: FruitsInventory = [
        .pineapple: 2
    ]
}

struct KiwiJuice: RecipeProtocol {
    var items: FruitsInventory = [
        .kiwi: 3
    ]
}

struct MangoJuice: RecipeProtocol {
    var items: FruitsInventory = [
        .mango: 3
    ]
}

struct StrawberryBananaJuice: RecipeProtocol {
    var items: FruitsInventory = [
        .strawberry: 10,
        .banana: 1
    ]
}

struct MangoKiwiJuice: RecipeProtocol {
    var items: FruitsInventory = [
        .mango: 2,
        .kiwi: 1
    ]
}
