//
//  JuiceMaker - JuiceMaker.swift
//  Created by Wonbi, woong
//

import Foundation

enum Juice: String {
    case strawberryJuice = "딸기 주스"
    case bananaJuice = "바나나 주스"
    case kiwiJuice = "키위 주스"
    case pineappleJuice = "파인애플 주스"
    case mangoJuice = "망고 주스"
    case strawberryBananaJuice = "딸바 주스"
    case mangoKiwiJuice = "망키 주스"
    
    var name: String {
        self.rawValue
    }
    
    fileprivate var ingredient: [(Fruit, Int)] {
        switch self {
        case .strawberryJuice:
            return [(.strawberry, 16)]
        case .bananaJuice:
            return [(.banana, 2)]
        case .kiwiJuice:
            return [(.kiwi, 3)]
        case .pineappleJuice:
            return [(.pineapple, 2)]
        case .mangoJuice:
            return [(.mango, 3)]
        case .strawberryBananaJuice:
            return [(.strawberry, 10), (.banana, 1)]
        case .mangoKiwiJuice:
            return [(.mango, 2), (.kiwi, 1)]
        }
    }
}

struct JuiceMaker {
    private var store: FruitStore
    
    init(store: FruitStore) {
        self.store = store
    }
    
    func makeJuice(_ juice: Juice) {
        guard store.canSupplyRequest(ingredient: juice.ingredient)
        else {
            NotificationCenter.default.post(name: .failedAlert, object: nil)
            return
        }
        print("true값")
        NotificationCenter.default.post(name: .madeJuiceAlert, object: nil, userInfo: ["JuiceName" : juice.name])
    }
    
}
