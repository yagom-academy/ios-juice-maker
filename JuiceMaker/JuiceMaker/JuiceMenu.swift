//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by 강인희 on 2020/11/16.
//

import Foundation

enum JuiceMenu{
    case strawberryJuice(name: String, requiredStrawberries: Int)
    case bananaJuice(name: String, requiredBananas: Int)
    case ddalbaJuice(name: String, requiredStrawberries: Int, requiredBananas: Int)
    case mangoJuice(name: String, requiredMangos: Int)
    case mangoKiwiJuice(name: String, requiredMangos: Int, requiredKiwis: Int)
    case kiwiJuice(name: String, requiredKiwis: Int)
    case pineappleJuice(name: String, requiredPineapples: Int)
}

