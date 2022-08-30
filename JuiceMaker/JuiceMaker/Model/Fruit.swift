//
//  Fruit.swift
//  JuiceMaker
//
//  Created by som, LJ on 2022/08/30.
//

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case banna
    case pineApple
    case kiwi
    case mango
    
    var name: String {
        switch self {
        case .strawberry:
            return "딸기"
        case .banna:
            return "바나나"
        case .pineApple:
            return "파인애플"
        case .kiwi:
            return "키위"
        case .mango:
            return "망고"
        }
    }
}
