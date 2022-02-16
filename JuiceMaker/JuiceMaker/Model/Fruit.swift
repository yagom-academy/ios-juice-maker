//
//  Fruit.swift
//  JuiceMaker
//
//  Created by temp2 on 2022/02/15.
//

import Foundation

/// 과일의 종류
enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
    
    /// 과일의 이름
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
