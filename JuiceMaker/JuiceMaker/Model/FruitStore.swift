//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import Foundation

enum Fruit: CaseIterable {
    case strawberry
    case banana
    case pineapple
    case kiwi
    case mango
}
// 과일 타입
class FruitStore: NSObject {
    static let shared = FruitStore()

    @objc dynamic var strawberry: UInt = 10
    @objc dynamic var banana: UInt = 10
    @objc dynamic var pineapple: UInt = 10
    @objc dynamic var kiwi: UInt = 10
    @objc dynamic var mango: UInt = 10
    
    subscript(_ fruit: Fruit) -> UInt {
        get {
            switch fruit {
            case .strawberry:
                return strawberry
            case .banana:
                return banana
            case .pineapple:
                return pineapple
            case .kiwi:
                return kiwi
            case .mango:
                return mango
            }
        }
        set {
            switch fruit {
            case .strawberry:
                strawberry = newValue
            case .banana:
                banana = newValue
            case .pineapple:
                pineapple = newValue
            case .kiwi:
                kiwi = newValue
            case .mango:
                mango = newValue
            }
        }
    }
    
    func changeStock(_ fruit: Fruit, _ changingQuantity: UInt) {
        self[fruit] -= changingQuantity
    }
    func changeCurrentStockToValue(_ fruit: Fruit, _ changedValue: UInt) {
        self[fruit] = changedValue
    }
}
