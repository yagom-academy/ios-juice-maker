//
//  Juice.swift
//  JuiceMaker
//
//  Created by yun on 2021/06/08.
//

import Foundation

enum Juice: String {
    case strawberry = "딸기 쥬스"
    case banana = "바나나 쥬스"
    case kiwi = "키위 쥬스"
    case pineapple = "파인애플 쥬스"
    case strawberryBanana = "딸바 쥬스"
    case mango = "망고 쥬스"
    case mangoKiwi = "망키 쥬스"
    
    var recipe: [JuiceRecipe] {
        switch self {
        case .strawberry:
            return [(Fruit.strawberry, 16)]
        case .banana:
            return [(.banana, 2)]
        case .kiwi:
            return [(.kiwi, 3)]
        case .pineapple:
            return [(.pineapple, 2)]
        case .strawberryBanana:
            return [(.strawberry, 10), (.banana, 1)]
        case .mango:
            return [(.mango, 3)]
        case .mangoKiwi:
            return [(.mango, 2), (.kiwi, 1)]
        }
    }
    
    var juiceName: String {
        return self.rawValue
    }
}


