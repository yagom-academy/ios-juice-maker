//
//  Fruit.swift
//  JuiceMaker
//
//  Created by 박우연 on 2021/10/28.
//

import Foundation

enum Fruit: String, CaseIterable {
    case strawberry, banana, pineapple, kiwi, mango
    static let initialValue = 10
    
    var stringValue: String {
        self.rawValue
    }
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
