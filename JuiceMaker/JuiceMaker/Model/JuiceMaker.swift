//
//  JuiceMaker - JuiceMaker.swift
//  Created by Andrew, 혜모리 on 2023.01.02
//

// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStore = FruitStore()
    
    enum Juice {
        case strawberryJuice
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case strawberryBananaJuice
        case mangoJuice
        case mangoKiwiJuice
        
        var cook: [FruitStore.Fruit: Int] {
            switch self {
            case .strawberryJuice:
                return [.strawberry: 16]
            case .bananaJuice:
                return [.banana: 2]
            case .kiwiJuice:
                return [.kiwi: 3]
            case .pineappleJuice:
                return [.pineapple: 2]
            case .mangoJuice:
                return [.mango: 3]
            case .strawberryBananaJuice:
                return [.strawberry: 10, .banana: 1]
            case .mangoKiwiJuice:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
}
