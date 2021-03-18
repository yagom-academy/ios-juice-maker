//
//  Juice.swift
//  JuiceMaker
//
//  Created by 잼킹 on 2021/03/18.
//

enum Juice: Int {
    case strawberry, banana, pineapple, kiwi, mango, strawnana, mangokiwi, tropical
    
    var name: String {
        switch self {
        case .strawberry:
            return "딸기쥬스"
        case .banana:
            return "바나나쥬스"
        case .pineapple:
            return "파인애플쥬스"
        case .kiwi:
            return "키위쥬스"
        case .mango:
            return "망고쥬스"
        case .strawnana:
            return "딸바쥬스"
        case .mangokiwi:
            return "망키쥬스"
        case .tropical:
            return "트로피컬쥬스"
        }
    }
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberry:
            return [.strawberry: 16]
        case .banana:
            return [.banana: 2]
        case .pineapple:
            return [.pineapple: 2]
        case .kiwi:
            return [.kiwi: 3]
        case .mango:
            return [.mango: 3]
        case .strawnana:
            return [.strawberry: 10, .banana: 1]
        case .mangokiwi:
            return [.mango: 2, .kiwi: 1]
        case .tropical:
            return [.strawberry: 1, .banana: 1, .pineapple: 1, .kiwi: 1, .mango: 1]
        }
    }
}
