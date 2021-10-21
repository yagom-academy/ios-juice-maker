//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker {
    
    private let fruitStore: FruitStorage
    
    init(store: FruitStorage) {
        self.fruitStore = store
    }
    
    func makeJuice(menu: JuiceMenu) throws {
        for (fruit, quantity) in menu.recipe {
            try fruitStore.changeFruitStock(of: fruit, by: quantity, calculate: -)
        }
    }
}

