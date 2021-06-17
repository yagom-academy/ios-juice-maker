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
class FruitStore: NSObject { // : ObservableObject?
    static let shared = FruitStore()

    @objc dynamic internal var strawberry: UInt = 10
    @objc dynamic internal var banana: UInt = 10
    @objc dynamic internal var pineapple: UInt = 10
    @objc dynamic internal var kiwi: UInt = 10
    @objc dynamic internal var mango: UInt = 10
    
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
    
    internal func changeStock(_ fruit: Fruit, _ changingQuantity: UInt) {
        self[fruit] -= changingQuantity
    }
    internal func changeCurrentStockToValue(_ fruit: Fruit, _ changedValue: UInt) {
        self[fruit] = changedValue
    }
}
