//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation



// 쥬스 메이커 타입
struct JuiceMaker {
    let fruitStores: [Fruits: FruitStore] = [
        .strawberry : StrawberryStock(),
        .banana: BananaStock(),
        .pineapple: PineappleStock(),
        .kiwi: KiwiStock(),
        .mango: MangoStock()
    ]

    enum JuiceType: Int {
        case strawberryJuice 
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case mangoJuice
        case ddalbaJuice
        case mangoKiwiJuice

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
                return [.mango: 2 , .kiwi: 1]
            }
        }
    }

    func makeJuice() {
        guard checkStock(fruit: .kiwiJuice) else {
            return
        }
    }

    // checkStock의 결과를 받아서 재고가 있으면 makejuice가 작동을하고 필요 레시피만큼 재료를 소진시킨다
    func checkStock(fruit: JuiceType) -> Bool {
        var results: [Bool] = []
        fruit.material().forEach { (fruitType,requiredAmount) in
            results.append(self.fruitStores[fruitType]?.isStockLeft(requiredAmount) ?? false)
        }
        let filtered = results.filter({ $0 })
        return !filtered.isEmpty
       
    }
}


