//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
   
    var count: Int = 0
    
    private(set) var fruitInventory: [Fruits: Int] {
        didSet {
            NotificationCenter.default.post(name: Notification.Name("changedInventory"), object: nil)
        }
    }
    
    static let shared = FruitStore()
    
    private init(defaultStock: Int) {
        fruitInventory = Dictionary(uniqueKeysWithValues: zip(Fruits.allCases, Fruits.allCases.map { _ in defaultStock }))
    }
    
    private convenience init() {
        self.init(defaultStock: 10)
    }
    
    func add(fruit: Fruits, of count: Int) {
        guard let numberOfFruit = fruitInventory[fruit], count >= 0 else {
            return
        }
        fruitInventory[fruit] = numberOfFruit + count
    }
    
    func subtract(fruit: Fruits, of count: Int) {
        guard let numberOfFruit = fruitInventory[fruit], count >= 0 else {
            return
        }
        fruitInventory[fruit] = numberOfFruit - count
    }
    
    func hasStock(of fruit: Fruits, count: Int) -> Bool {
        guard let numberOfFruit = fruitInventory[fruit] else {
            return false
        }
        return numberOfFruit >= count
    }
}
