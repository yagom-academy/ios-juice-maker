//
//  JuiceMaker - FruitStore.swift
//  Created by EHD, Soll.
//  Copyright © yagom. All rights reserved.
//

import Foundation

// 과일 타입
class FruitStore {
    enum Fruit {
        case strawberry
        case banana
        case pineapple
        case kiwi
        case mango
    }
    
    let defaultStock: UInt = 10
    var storage: [Fruit: UInt]
    
    init() {
        storage = [.strawberry: defaultStock,
                   .banana: defaultStock,
                   .pineapple: defaultStock,
                   .kiwi: defaultStock,
                   .mango: defaultStock]
    }
    
    func modifyStock(fruit: Fruit, changes: Int) {
        guard let currentStock = storage[fruit] else {
            return
        }
        let sumResult = changes + Int(currentStock)
        
        if sumResult >= 0 {
            storage[fruit] = UInt(sumResult)
            sendNotifications()
            
        } else {
            storage[fruit] = 0
        }
    }
    
    func sendNotifications() {
        let userInfo: [Fruit : UInt] = storage
        
        NotificationCenter.default.post(name: NSNotification.Name("fruitNumberChanged"),
                                        object: nil,
                                        userInfo: userInfo)
    }
}
