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
        case strawberryJuice = 0
        case bananaJuice
        case pineappleJuice
        case kiwiJuice
        case mangoJuice
        case ddalbaJuice
        case mangoKiwiJuice

        func material() -> [Fruits] {
            switch self {
            case .strawberryJuice:
                return [.strawberry]
            case .bananaJuice:
                return [.banana]
            case .pineappleJuice:
                return [.pineapple]
            case .kiwiJuice:
                return [.kiwi]
            case .mangoJuice:
                return [.mango]
            case .ddalbaJuice:
                return [.strawberry, .banana]
            case .mangoKiwiJuice:
                return [.mango ,.kiwi]
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
        fruit.material().forEach { fruitType in
            results.append(self.fruitStores[fruitType]?.isStockLeft() ?? false)
        }
        let filtered = results.filter({ $0 })
        return !filtered.isEmpty
       
    }
}


