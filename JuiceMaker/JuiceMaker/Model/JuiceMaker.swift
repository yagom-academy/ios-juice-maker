//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

struct JuiceMaker: Makable {
    
    private var store: Storable
    
    init(store: Storable) {
        self.store = store
    }
    
    func make(into stuff: Stuff) throws -> Bool {
        guard let juice = Juice(rawValue: stuff.name) else {
            return false
        }
        for ingredient in juice.ingredients {
            let _ = try store.isStock(ingredient.fruit, as: ingredient.count)
        }
        for ingredient in juice.ingredients {
            let _ = try store.use(ingredient.fruit, to: ingredient.count)
        }
        
        return true
    }
    
}
