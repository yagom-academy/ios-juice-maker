//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 수꿍, 바드 on 2022/04/25.
//

enum Fruit: String {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}

extension Fruit {
    var name: String {
        switch self {
        case .strawberry:
            return "strawberry"
        case .banana:
            return "banana"
        case .pineapple:
            return "pineapple"
        case .kiwi:
            return "kiwi"
        case .mango:
            return "mango"
        }
    }
}
