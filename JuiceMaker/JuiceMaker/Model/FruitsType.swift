//
//  FruitsType.swift
//  JuiceMaker
//
//  Created by Eddy on 2022/02/22.
//

import Foundation

enum FruitsTypes: CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango, strawberryBanana, mangoKiwi
    private var juiceName: String {
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
}
