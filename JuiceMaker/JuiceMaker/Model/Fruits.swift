//
//  Fruits.swift
//  JuiceMaker
//
//  Created by Yetti, yy-ss99, Mary.
//

enum Fruits: CustomStringConvertible {
    case strawberry
    case banana
    case pineapple
    case mango
    case kiwi
    
    var description: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banana:
            return "바나나"
        case .pineapple:
            return "파인애플"
        case .mango:
            return "망고"
        case .kiwi:
            return "키위"
        }
    }
}
