//
//  Fruits.swift
//  JuiceMaker
//
//  Created by bradheo65, bonf, ZZBAE on 2022/04/26.
//

enum Fruit: Int, CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango

    var name: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .pineapple:
            return "파인애플"
        case .kiwi:
            return "키위"
        case .mango:
            return "망고"
        }
    }
}
