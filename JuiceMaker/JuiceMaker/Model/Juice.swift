//
//  Juice.swift
//  JuiceMaker
//
//  Created by taehun kim on 2022/02/22.
//

enum Juice: CustomStringConvertible {
    case strawberryJuice
    case kiwiJuice
    case bananaJuice
    case pineappleJuice
    case mangoJuice
    case mangoKiwiJuice
    case strawberryBananaJuice
    
    var description: String {
        switch self {
        case .strawberryJuice:
            return "딸기 쥬스"
        case .kiwiJuice:
            return "키위 쥬스"
        case .bananaJuice:
            return "바나나 쥬스"
        case .pineappleJuice:
            return "파인애플 쥬스"
        case .mangoJuice:
            return "망고 쥬스"
        case .mangoKiwiJuice:
            return "망키 쥬스"
        case .strawberryBananaJuice:
            return "딸바 쥬스"
        }
    }
    
    var recipe: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: 16]
        case .kiwiJuice:
            return [.kiwi: 3]
        case .bananaJuice:
            return [.banana: 2]
        case .pineappleJuice:
            return [.pineapple: 2]
        case .mangoJuice:
            return [.mango: 3]
        case .mangoKiwiJuice:
            return [.mango: 2, .kiwi: 1]
        case .strawberryBananaJuice:
            return [.strawberry: 10, .banana: 1]
        }
    }
}
