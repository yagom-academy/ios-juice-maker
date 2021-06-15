//
//  JuiceMaker - FruitStore.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import Foundation

// 과일 타입
class FruitStore {
    private let defaultStock: UInt = 10

    enum Fruit {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }

    static var storage: [Fruit: UInt] = [.strawberry: FruitStore().defaultStock,
                                         .banana: FruitStore().defaultStock,
                                         .pineapple: FruitStore().defaultStock,
                                         .kiwi: FruitStore().defaultStock,
                                         .mango: FruitStore().defaultStock]

    func modifyStock(fruit: Fruit, changes: Int) {
        guard let currentStock = FruitStore.storage[fruit] else {
            return
        }
        let sumResult = changes + Int(currentStock)

        if sumResult >= 0 {
            FruitStore.storage[fruit] = UInt(sumResult)
        } else {
            FruitStore.storage[fruit] = 0
        }
    }
}
