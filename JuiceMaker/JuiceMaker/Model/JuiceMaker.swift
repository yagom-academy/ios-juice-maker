//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    func tell(name: Juice) -> String { 
        switch name {
        case .strawberryJuice:
            return "딸기"
        case .bananaJuice:
            return "바나나"
        case .kiwiJuice:
            return "키위"
        case .pineappleJuice:
            return "파인애플"
        case .strawberryBananaJuice:
            return "딸바"
        case .mangoJuice:
            return "망고"
        case .mangoKiwiJuice:
            return "망키"
        }
    }
}
