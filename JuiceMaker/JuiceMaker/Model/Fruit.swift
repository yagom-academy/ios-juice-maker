//  JuiceMaker - Fruit.swift
//  Created by Vetto, 레옹아범 on 2023.1.2

enum Fruit {
    case strawberry, banana, kiwi, mango, pineapple
    
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
