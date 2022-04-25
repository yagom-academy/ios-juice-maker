//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

// 과일 저장소 타입
class FruitStore {
    var stock: Dictionary<FruitKind, Int> =
    [FruitKind.strawberry: 10,
     FruitKind.banana: 10,
     FruitKind.kiwi: 10,
     FruitKind.pineaple : 10,
     FruitKind.mango: 10]
    
    func changeAmountFruit(fruitName: FruitKind, amount: Int) -> Void {
        switch fruitName {
        case .strawberry:
            stock[FruitKind.strawberry] = amount
        case .banana:
            stock[FruitKind.banana] = amount
        case .pineaple:
            stock[FruitKind.pineaple] = amount
        case .kiwi:
            stock[FruitKind.kiwi] = amount
        case .mango:
            stock[FruitKind.mango] = amount
        }
    }
}
