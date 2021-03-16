//
//  JuiceData.swift
//  JuiceMaker
//
//  Created by 윤재웅 on 2021/03/15.
//

import Foundation

typealias Storage = [Fruits : Int]

enum Fruits: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
}

enum Juices: String {
    case strawberryJuice = "딸기 쥬스 주문"
    case bananaJuice = "바나나 쥬스 주문"
    case pineappleJuice = "파인애플 쥬스 주문"
    case kiwiJuice = "키위 쥬스 주문"
    case mangoJuice = "망고 쥬스 주문"
    case strawberryBananaJuice = "딸기 바나나 쥬스 주문"
    case mangoKiwiJuice = "망고 키위 쥬스 주문"
    
    var recipe : Storage {
        switch self {
        case .strawberryJuice:
            return [.strawberry : 16]
        case .bananaJuice:
            return [.banana : 2]
        case .pineappleJuice:
            return [.pineapple : 2]
        case .kiwiJuice:
            return [.kiwi : 3]
        case .mangoJuice:
            return [.mango : 3]
        case .strawberryBananaJuice:
            return [.strawberry : 10, .banana : 1]
        case .mangoKiwiJuice:
            return [.mango : 2, .kiwi : 1]
        }
    }
}

extension Juices: CustomStringConvertible {
    var description: String {
        switch self {
        case .strawberryJuice:
            return "딸기 쥬스"
        case .bananaJuice:
            return "바나나 쥬스"
        case .pineappleJuice:
            return "파인애플 쥬스"
        case .kiwiJuice:
            return "키위 쥬스"
        case .mangoJuice:
            return "망고 쥬스"
        case .strawberryBananaJuice:
            return "딸기 바나나 쥬스"
        case .mangoKiwiJuice:
            return "망고 키위 쥬스"
        }
    }
}
