//
//  JuiceMenu.swift
//  JuiceMaker
//
//  Created by 홍진태 on 2021/06/08.
//

import Foundation

enum JuiceMenu: String {
    case strawberryJuice = "딸기쥬스"
    case bananaJuice = "바나나쥬스"
    case kiwiJuice = "키위쥬스"
    case pineappleJuice = "파인애플 쥬스"
    case strawberryBananaJuice = "딸바쥬스"
    case mangoJuice = "망고 쥬스"
    case mangoKiwiJuice = "망고키위 쥬스"
    
    var neededFruits: [Fruits: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .bananaJuice:
            return [.banana: 2]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        case .mangoJuice:
            return [.mango: 3]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        }
    }
}

//- 딸기쥬스 : 딸기 16개 소모
//- 바나나쥬스 : 바나나 2개 소모
//- 키위쥬스 : 키위 3개 소모
//- 파인애플 쥬스 : 파인애플 2개 소모
//- 딸바쥬스 : 딸기 10개 + 바나나 1개 소모
//- 망고 쥬스 : 망고 3개 소모
//- 망고키위 쥬스 : 망고 2개 + 키위 1개 소모
