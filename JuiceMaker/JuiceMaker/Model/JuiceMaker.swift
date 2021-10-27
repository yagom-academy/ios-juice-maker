//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

// 쥬스 메이커 타입
struct JuiceMaker {
    enum Juice: String, CustomStringConvertible {
        var description: String {
            return "\(self.rawValue)"
        }
        
        case strawberryJuice = "딸기쥬스"
        case bananaJuice = "바나나쥬스"
        case kiwiJuice = "키위쥬스"
        case pineappleJuice = "파인애플쥬스"
        case mangoJuice = "망고쥬스"
        case strawbettyBananaJuice = "딸바쥬스"
        case mangoKiwiJuice = "망키쥬스"
        
        var recipe: [Fruit: Int] {
            switch self {
            case .strawberryJuice:
                return [.strawberry: 16]
            case .bananaJuice:
                return [.banana: 2]
            case .kiwiJuice:
                return [.kiwi: 3]
            case .pineappleJuice:
                return [.pineapple: 2]
            case .mangoJuice:
                return [.mango: 3]
            case .strawbettyBananaJuice:
                return [.strawberry: 10, .banana: 1]
            case .mangoKiwiJuice:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    func make(juice: Juice) throws {
        try FruitStore.shared.updateStock(of: juice.recipe)
        
        print("\(juice)가 만들어졌습니다!")
    }
}
