//
//  Juice.swift
//  Created by Ash, 미니.
//

enum Juice: Int, CaseIterable {
    case strawberryJuice
    case bananaJuice
    case pineappleJuice
    case kiwiJuice
    case mangoJuice
    case strawberrybananaJuice
    case mangokiwiJuice
    
    var needFruitAndStock: [Fruit: Int] {
        switch self {
        case .strawberryJuice:
            return [.strawberry: -16]
        case .bananaJuice:
            return [.banana: -2]
        case .kiwiJuice:
            return [.kiwi: -3]
        case .pineappleJuice:
            return [.pineapple: -2]
        case .mangoJuice:
            return [.mango: -3]
        case .strawberrybananaJuice:
            return [.strawberry: -10, .banana: -1]
        case .mangokiwiJuice:
            return [.mango: -2, .kiwi: -1]
        }
    }
    
    var description: String {
        switch self {
        case .strawberryJuice:
            return "딸기 주스"
        case .bananaJuice:
            return "바나나 주스"
        case .pineappleJuice:
            return "파인애플 주스"
        case .kiwiJuice:
            return "키위 주스"
        case .mangoJuice:
            return "망고 주스"
        case .strawberrybananaJuice:
            return "딸기 바나나 주스"
        case .mangokiwiJuice:
            return "망고 키위 주스"
        }
    }
}
