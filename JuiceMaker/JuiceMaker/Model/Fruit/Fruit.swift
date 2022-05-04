//
//  Fruits.swift
//  JuiceMaker
//
//  Created by bradheo65, bonf, ZZBAE on 2022/04/26.
//

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case kiwi
    case mango
    case pineapple

    var name: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .kiwi:
            return "키위"
        case .mango:
            return "망고"
        case .pineapple:
            return "파인애플"
        }
    }
}
