//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation
import UIKit

class FruitStore {
    enum Fruits: String, CaseIterable {
        case strawberry = "strawberry"
        case banana = "banana"
        case pineapple = "pineapple"
        case kiwi = "kiwi"
        case mango = "mango"
        
        static func findFruit(fruitID: String) -> Fruits? {
            if fruitID.hasPrefix("strawberry") {
                return .strawberry
            } else if fruitID.hasPrefix("banana") {
                return .banana
            } else if fruitID.hasPrefix("pineapple") {
                return .pineapple
            } else if fruitID.hasPrefix("kiwi") {
                return .kiwi
            } else if fruitID.hasPrefix("mango") {
                return .mango
            }
            
            return nil
        }
    }
    
    private var fruitInventory: [Fruits: Int]
    
    var inventoryStatus: [Fruits: Int] {
        return fruitInventory
    }
    
    static let shared = FruitStore()
    
    private init(defaultStock: Int) {
        self.fruitInventory = [:]
        Fruits.allCases.forEach { fruitInventory[$0] = defaultStock }
    }
    
    private convenience init() {
        self.init(defaultStock: 10)
    }
    
    func add(fruit: Fruits, of count: Int) {
        guard let numberOfFruit = fruitInventory[fruit], count >= 0 else {
            return
        }
        fruitInventory[fruit] = numberOfFruit + count
        NotificationCenter.default.post(name: Notification.Name("changedInventory"), object: nil)
    }
    
    func subtract(fruit: Fruits, of count: Int) {
        guard let numberOfFruit = fruitInventory[fruit], count >= 0 else {
            return
        }
        fruitInventory[fruit] = numberOfFruit - count
        NotificationCenter.default.post(name: Notification.Name("changedInventory"), object: nil)
    }
    
    func hasStock(of fruit: Fruits, count: Int) -> Bool {
        guard let numberOfFruit = fruitInventory[fruit] else {
            return false
        }
        return numberOfFruit >= count
    }
    
}
