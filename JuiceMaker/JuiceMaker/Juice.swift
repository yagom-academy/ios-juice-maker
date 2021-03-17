//
//  Juice.swift
//  JuiceMaker
//
//  Created by 김민성 on 2021/03/14.
//

import Foundation

typealias Recipe = (stock: ObjectIdentifier, requiredAmount: Int)

class Juice {
    private let name: String
    private let recipe: [Recipe]

    init(name: String, recipe: [Recipe]) {
        self.name = name
        self.recipe = recipe
    }
}

class StrawberryJuice: Juice {}

class BananaJuice: Juice {}

class KiwiJuice: Juice {}

class PineappleJuice: Juice {}

class MangoJuice: Juice {}

class StrawberryBananaJuice: Juice {}

class MangoKiwiJuice: Juice {}
