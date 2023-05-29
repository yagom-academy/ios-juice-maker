//
//  Fruits.swift
//  JuiceMaker
//
//  Created by Yetti, yy-ss99, Mary.
//

enum Fruits: CustomStringConvertible, CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    var description: String {
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
