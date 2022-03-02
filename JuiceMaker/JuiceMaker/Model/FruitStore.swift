//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    static let shared = FruitStore()
    var inventory: [Fruit: Int] = [:]
    
    private init() {
        let defaultQuantity = 10
        Fruit.allCases.forEach{ inventory[$0] = defaultQuantity }
    }
}
