//
//  Juice.swift
//  JuiceMaker
//
//  Created by 김민성 on 2021/03/14.
//

import Foundation

typealias Recipe = (stock: ObjectIdentifier, requiredAmount: Int)

class Juice {
    let name: String

    init(name: String) {
        self.name = name
    }
}

class StrawberryJuice: Juice {}
class BananaJuice: Juice {}
class KiwiJuice: Juice {}
class PineappleJuice: Juice {}
class MangoJuice: Juice {}
class StrawberryBananaJuice: Juice {}
class MangoKiwiJuice: Juice {}
