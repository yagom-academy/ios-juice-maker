//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

enum JuiceMenu {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case pineappleJuice
    case mangoJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
}

// 쥬스 메이커 타입
struct JuiceMaker {
    var fruit = FruitStore()
    
    func makeJuice(juice: JuiceMenu) {
        switch juice {
        case .strawberryJuice:
        case .bananaJuice:
        case .kiwiJuice:
        case .pineappleJuice:
        case .mangoJuice:
        case .strawberryBananaJuice:
        case .mangoKiwiJuice:
        }
    }
}
