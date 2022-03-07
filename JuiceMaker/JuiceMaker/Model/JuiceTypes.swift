//
//  FruitsType.swift
//  JuiceMaker
//
//  Created by Eddy on 2022/02/22.
//

import Foundation

enum JuiceTypes: Int, CaseIterable, CustomStringConvertible {
    case strawberryBanana = 1, mangoKiwi, strawberry, banana, pineapple, kiwi, mango
    var description: String {
        switch self {
        case .strawberryBanana:
            return "딸바쥬스"
        case .mangoKiwi:
            return "망고키위쥬스"
        case .strawberry:
            return "딸기 쥬스"
        case .banana:
            return "바나나 쥬스"
        case .pineapple:
            return "파인애플 쥬스"
        case .kiwi:
            return "키위 쥬스"
        case .mango:
            return "망고 쥬스"
        }
    }
    var recipe: [FruitsTypes: Int] {
        switch self {
        case .strawberryBanana:
            return [.strawberry: 10, .banana: 1]
        case .mangoKiwi:
            return [.mango: 2, .kiwi: 1]
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .pineapple:
            return [.pineapple: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .mango:
            return [.mango: 3]
        }
    }
}
