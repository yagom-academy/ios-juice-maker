//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

struct JuiceMaker {
    
    let fruitStore = FruitStore.shared
    
    func make(juice: Juice) throws {
        do {
            try fruitStore.consumeStock(with: juice)
        } catch {
            throw StockError.notEnoughStock
        }
    }
    
    func tell(name: Juice) -> String { 
        switch name {
        case .strawberryJuice:
            return "딸기"
        case .bananaJuice:
            return "바나나"
        case .kiwiJuice:
            return "키위"
        case .pineappleJuice:
            return "파인애플"
        case .strawberryBananaJuice:
            return "딸바"
        case .mangoJuice:
            return "망고"
        case .mangoKiwiJuice:
            return "망키"
        }
    }
}
