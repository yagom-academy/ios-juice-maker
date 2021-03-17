//
//  Juice.swift
//  JuiceMaker
//
//  Created by 기원우 on 2021/03/17.
//

import Foundation

class Juice {
    private let _name: String
    
    init(name: String) {
        _name = name
    }
}

class StrawberryJuice: Juice {}
class BananaJuice: Juice {}
class PineappleJuice: Juice {}
class KiwiJuice: Juice {}
class MangoJuice: Juice {}
class StrawberryBananaJuice: Juice {}
class MangoKiwiJuice: Juice {}
