//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    var fruitInventory: [Fruit: Int] = [:]
    
    init() {
        let defaultQuantity = 10
        Fruit.allCases.forEach{ self.fruitInventory[$0] = defaultQuantity }
    }
}
