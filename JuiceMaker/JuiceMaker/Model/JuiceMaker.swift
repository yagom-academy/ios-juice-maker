//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation



// 쥬스 메이커 타입
struct JuiceMaker {
    
    let fruitStore: [Fruits: FruitStore] = [
        .strawberry: StrawberryStock(),
        .banana: BananaStock(),
        .pineapple: PineappleStock(),
        .kiwi: KiwiStock(),
        .mango: MangoStock()
    ]
    
    enum JuiceType: String {
        case strawberryJuice = "딸기 쥬스"
        case bananaJuice = "바나나 쥬스"
        case pineappleJuice = "파인애플 쥬스"
        case kiwiJuice = "키위 쥬스"
        case mangoJuice = "망고 쥬스"
        case ddalbaJuice = "딸바 쥬스"
        case mangoKiwiJuice = "망키 쥬스"
        
        func material() -> [Fruits: Int] {
            switch self {
            case .strawberryJuice:
                return [.strawberry: 16]
            case .bananaJuice:
                return [.banana: 2]
            case .pineappleJuice:
                return [.pineapple: 3]
            case .kiwiJuice:
                return [.kiwi: 2]
            case .mangoJuice:
                return [.mango: 3]
            case .ddalbaJuice:
                return [.strawberry: 10, .banana: 1]
            case .mangoKiwiJuice:
                return [.mango: 2, .kiwi: 1]
            }
        }
    }
    
    func makeJuice(order: JuiceType) {
        guard checkStock(fruit: order) else {
            return
        }
        order.material().forEach { (fruitType,requiredAmount) in
            self.fruitStore[fruitType]?.stockMinus(stock: requiredAmount)
        }
    }
    
    func checkStock(fruit: JuiceType) -> Bool {
        var results: [Bool] = []
        fruit.material().forEach { (fruitType,requiredAmount) in
            results.append(self.fruitStore[fruitType]?.isStockLeft(requiredAmount) ?? false)
        }
        return !results.filter({ $0 }).isEmpty
    }
}


