//
//  JuiceMaker - FruitStore.swift
//  Created by  marisol, mmim. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

final class FruitStore {
    var inventory: [Fruit: Int] = [:]
    
    init() {
        let defaultQuantity = 10
        Fruit.allCases.forEach{ inventory[$0] = defaultQuantity }
    }
}
