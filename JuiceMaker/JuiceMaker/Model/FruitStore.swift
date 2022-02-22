//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation

class FruitStore {
    static let defaultQuantity = 10
    static var fruitInventory: Dictionary = [Fruit.strawberry: defaultQuantity,
                                             Fruit.banana: defaultQuantity,
                                             Fruit.pineapple: defaultQuantity,
                                             Fruit.kiwi: defaultQuantity,
                                             Fruit.mango: defaultQuantity]
}
