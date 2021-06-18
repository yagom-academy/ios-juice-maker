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
    
    @objc dynamic var strawberry = 10
    @objc dynamic var banana = 10
    @objc dynamic var pineapple = 10
    @objc dynamic var kiwi = 10
    @objc dynamic var mango = 10
    
    subscript(_ fruit: Fruit) -> Int {
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
    func currentStock(_ fruit: Fruit) -> Int {
        return self[fruit]
    }
    func changeStock(_ fruit: Fruit, _ changingQuantity: Int) {
        self[fruit] = currentStock(fruit) - changingQuantity
    }
}
