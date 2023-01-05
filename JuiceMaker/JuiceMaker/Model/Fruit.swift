//
//  FruitType.swift
//  JuiceMaker
//
//  Created by Rhode, Christy on 2023/01/03.
//

enum Fruit: CaseIterable {
    case 딸기, 바나나, 파인애플, 키위, 망고
}

enum Juice {
    case 딸기쥬스
    case 바나나쥬스
    case 키위쥬스
    case 파인애플쥬스
    case 딸바쥬스
    case 망고쥬스
    case 망고키위쥬스
    
    var selectRecipe: [Fruit: Int] {
        switch self {
        case .딸기쥬스:
            return [.딸기: 16]
        case .바나나쥬스:
            return [.바나나: 2]
        case .키위쥬스:
            return [.키위: 3]
        case .파인애플쥬스:
            return [.파인애플: 2]
        case .딸바쥬스:
            return [.딸기: 10, .바나나: 1]
        case .망고쥬스:
            return [.망고: 3]
        case .망고키위쥬스:
            return [.망고: 2, .키위: 1]
        }
    }
}
