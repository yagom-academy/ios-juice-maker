//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker: Makable {
    
    typealias Storable = FruitStore
    
    private var store: Storable
    
    init(store: Storable) {
        self.store = store
    }
    
    func make(into stuff: Juice) throws -> Bool {
        for ingredient in stuff.ingredients {
            let _ = try store.isStock(ingredient.fruit, as: ingredient.count)
        }
        for ingredient in stuff.ingredients {
            let _ = try store.use(ingredient.fruit, to: ingredient.count)
        }
        
        return true
    }
    
}
