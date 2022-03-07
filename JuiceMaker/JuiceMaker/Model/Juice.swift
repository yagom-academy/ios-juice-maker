//
//  Juice.swift
//  JuiceMaker
//
//  Created by 이시원 on 2022/03/01.
//

import Foundation

enum Juice: String, CustomStringConvertible {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case pineappleJuice = "파인애플쥬스"
    case kiwiJuice = "키위쥬스"
    case mangoJuice = "망고쥬스"
    case strawberryAndBananaJuice = "딸바쥬스"
    case mangoAndKiwiJuice = "망키쥬스"
    
    var description: String {
        return self.rawValue
    }
}
