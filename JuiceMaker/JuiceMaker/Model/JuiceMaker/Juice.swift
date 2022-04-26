//
//  Juice.swift
//  JuiceMaker
//
//  Created by 이원빈 on 2022/04/26.
//

import Foundation

enum Juice {
    case strawberryJuice
    case bananaJuice
    case kiwiJuice
    case mangoJuice
    case pineappleJuice
    case strawberryBananaJuice
    case mangoKiwiJuice
}

extension Juice {
    /// 해당 쥬스의 재료값 반환 함수
    ///
    ///  Returns: [Fruit:Int] Dictionary
    func requireIngredients() -> [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry : 16]
        case .bananaJuice:
            return [.banana : 2]
        case .kiwiJuice:
            return [.kiwi : 3]
        case .mangoJuice:
            return [.mango : 3]
        case .pineappleJuice:
            return [.pineapple : 2]
        case .strawberryBananaJuice:
            return [.strawberry : 10, .banana : 1]
        case .mangoKiwiJuice:
            return [.mango : 2, .kiwi : 1]
        }
    }
}
