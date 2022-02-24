//
//  JuiceMaker - FruitStore.swift
//  Created by safari and Red. 
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


class FruitStore {
    private let defaultStock: Int = 10
    private(set) var stock: [Fruit: Int]

    init() {
        stock = [.strawberry: defaultStock,
                     .banana: defaultStock,
                     .pineapple: defaultStock,
                     .kiwi: defaultStock,
                     .mango: defaultStock]
    }
    
    func updateStock(of fruit: Fruit, to numberOfFruit: Int) {
        stock[fruit] = numberOfFruit
    }
    
    
}
